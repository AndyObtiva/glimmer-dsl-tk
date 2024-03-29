# Copyright (c) 2020-2022 Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'glimmer/tk/widget_proxy'

module Glimmer
  module Tk
    # Proxy for Tk::Text
    #
    # Follows the Proxy Design Pattern
    class TextProxy < WidgetProxy
      ALL_TAG = '__all__'
      FORMAT_DEFAULT_MAP = {
        'justify' => 'left',
      }
    
      def handle_listener(listener_name, &listener)
        case listener_name.to_s.downcase
        when '<<modified>>', '<modified>', 'modified'
          modified_listener = Proc.new do |*args|
            @modified_count ||= 0
            @modified_count += 1
            listener.call(*args)
            @insert_mark_moved_proc&.call
            @tk.modified = false
          end
          @tk.bind('<Modified>', modified_listener)
        when '<<selection>>', '<selection>', 'selection'
          @tk.bind('<Selection>', listener)
        when 'destroy'
          super
        when 'insertmarkmove', 'insertmarkmoved', 'insert_mark_move', 'insert_mark_moved'
          if @insert_mark_moved_proc.nil?
            handle_listener('KeyPress') do |event|
              @insert_mark_moved_proc&.call
            end
            handle_listener('KeyRelease') do |event|
              @insert_mark_moved_proc&.call
            end
            handle_listener('ButtonPress') do |event|
              @insert_mark_moved_proc&.call
            end
            handle_listener('ButtonRelease') do |event|
              @insert_mark_moved_proc&.call
            end
          end
          @insert_mark = @tk.index('insert')
          @insert_mark_moved_proc = Proc.new do
            new_insert_mark = @tk.index('insert')
            if new_insert_mark != @insert_mark
              @insert_mark = new_insert_mark
              listener.call(new_insert_mark)
            end
          end
        else
          super
        end
      end
      
      def edit_undo
        # <Modified> fires twice the first time, which is equivalent to one change.
        if @modified_count.to_i > 2
          # must count the extra 2 modified count that will occur upon undo too
          @modified_count -= 4
          @tk.edit_undo
        end
      end
      
      def edit_redo
        begin
          @tk.edit_redo
        rescue => e
          # No Op
        end
      end
      
      def add_selection_format(option, value, no_selection_default: :insert_word, focus: true)
        process_selection_ranges(no_selection_default: no_selection_default, focus: focus) { |range_start, range_end| add_format(range_start, range_end, option, value) }
      end
      
      def remove_selection_format(option, value, no_selection_default: :insert_word, focus: true)
        process_selection_ranges(no_selection_default: no_selection_default, focus: focus) { |range_start, range_end| remove_format(range_start, range_end, option, value) }
      end
      
      def toggle_selection_format(option, value, no_selection_default: :insert_word, focus: true)
        process_selection_ranges(no_selection_default: no_selection_default, focus: focus) { |range_start, range_end| toggle_format(range_start, range_end, option, value) }
      end
      
      def add_selection_font_format(option, value, no_selection_default: :insert_word, focus: true)
        process_selection_ranges(no_selection_default: no_selection_default, focus: focus) { |range_start, range_end| add_font_format(range_start, range_end, option, value) }
      end
      
      def remove_selection_font_format(option, value, no_selection_default: :insert_word, focus: true)
        process_selection_ranges(no_selection_default: no_selection_default, focus: focus) { |range_start, range_end| remove_font_format(range_start, range_end, option, value) }
      end
      
      def toggle_selection_font_format(option, value, no_selection_default: :insert_word, focus: true)
        process_selection_ranges(no_selection_default: no_selection_default, focus: focus) { |range_start, range_end| toggle_font_format(range_start, range_end, option, value) }
      end
      
      def process_selection_ranges(no_selection_default: :insert_word, focus: true, &processor)
        regions = @tk.tag_ranges('sel')
        if regions.empty?
          case no_selection_default
          when :insert_word
            regions = [[@tk.index('insert wordstart'), @tk.index('insert wordend + 1 char')]]
          when :insert_letter
            regions = [[@tk.index('insert'), @tk.index('insert + 1 char')]]
          end
        end
        regions.each do |region|
          range_start = region.first
          range_end = region.last
          processor.call(range_start, range_end)
        end
        if focus == true
          @tk.focus
        elsif focus.is_a?(Integer)
          ::Tk.after(focus) { @tk.focus }
        end
      end
      
      def applied_format?(region_start, region_end, option, value)
        !applied_format_tags(region_start, region_end, option, value).empty?
      end
      
      def applied_format_tags(region_start, region_end, option, value)
        tag_names = @tk.tag_names - ['sel', ALL_TAG]
        
        tag_names.select do |tag_name|
          @tk.tag_ranges(tag_name).any? do |range|
            if text_index_less_than_or_equal_to_other_text_index?(range.first, region_start) && text_index_greater_than_or_equal_to_other_text_index?(range.last, region_end)
              @tk.tag_cget(tag_name, option) == value
            end
          end
        end
      end
            
      def applied_format_value(text_index = nil, option)
        text_index ||= @tk.index('insert')
        region_start = text_index
        region_end = text_index
        tag_names = @tk.tag_names - ['sel', ALL_TAG]
        
        values = tag_names.map do |tag_name|
          @tk.tag_ranges(tag_name).map do |range|
            if text_index_less_than_or_equal_to_other_text_index?(range.first, region_start) && text_index_greater_than_or_equal_to_other_text_index?(range.last, region_end)
              @tk.tag_cget(tag_name, option)
            end
          end
        end.flatten.reject {|value| value.to_s.empty?}
        
        values.last || (@tk.send(option) rescue FORMAT_DEFAULT_MAP[option])
      end
            
      def add_format(region_start, region_end, option, value)
        @@tag_number = 0 unless defined?(@@tag_number)
        tag = "tag_#{option}_#{@@tag_number += 1}"
        @tk.tag_configure(tag, {option => value})
        @tk.tag_add(tag, region_start, region_end)
        tag
      end
      
      def remove_format(region_start, region_end, option, value)
        partial_intersection_option_applied_tags = tag_names.select do |tag_name|
          @tk.tag_ranges(tag_name).any? do |range|
            if range.first.to_f.between?(region_start.to_f, region_end.to_f) or
               range.last.to_f.between?(region_start.to_f, region_end.to_f) or
               (text_index_less_than_or_equal_to_other_text_index?(range.first, region_start) && text_index_greater_than_or_equal_to_other_text_index?(range.last, region_end))
              @tk.tag_cget(tag_name, option) == value
            end
          end
        end
        
        partial_intersection_option_applied_tags.each do |tag_name|
          @tk.tag_remove(tag_name, region_start, region_end)
        end
        
        nil
      end
      
      # toggles option/value tag (removes if already applied)
      def toggle_format(region_start, region_end, option, value)
        if applied_format?(region_start, region_end, option, value)
          remove_format(region_start, region_end, option, value)
        else
          add_format(region_start, region_end, option, value)
        end
      end
           
      # TODO Algorithm for font option formatting
      # for a region, grab all the latest tags for each subregion as well as the widget font for subregions without a tag
      # for each part of the region covered by a tag, augment its font with new font option (or remove if that is what is needed)
      # Once add and remove are implemented, implement toggle
      # Also, there is a need for a method that checks if a font option value applies to an entire region (to decide which way to toggle with toggle method)
      def applied_font_format?(region_start, region_end, font_option, value)
        applied_font_format_tags_and_regions(region_start, region_end).all? do |tag, region_start, region_end|
          if tag.nil?
            @tk.font.send(font_option) == value
          else
            @tk.tag_cget(tag, 'font').send(font_option) == value
          end
        end
      end

      def applied_font_format_tags_and_regions(region_start, region_end)
        lines = value.split("\n")
        tags_and_regions = []
        all_tag_names = (@tk.tag_names - ['sel', ALL_TAG]).select {|tag_name| tag_name.include?('_font_')}
        (region_start.to_i..region_end.to_i).each do |line_number|
          start_character_index = 0
          start_character_index = region_start.to_s.split('.').last.to_i if line_number == region_start.to_i
          end_character_index = lines[line_number - 1].to_s.size
          end_character_index = region_end.to_s.split('.').last.to_i if line_number == region_end.to_i
          (start_character_index...end_character_index).each do |character_index|
            text_index = "#{line_number}.#{character_index}"
            region_tag = all_tag_names.reverse.find do |tag|
              @tk.tag_cget(tag, 'font') && @tk.tag_ranges(tag).any? do |range_start, range_end|
                text_index_less_than_or_equal_to_other_text_index?(range_start, text_index) && text_index_greater_than_or_equal_to_other_text_index?(range_end, text_index)
              end
            end
            end_text_index = add_to_text_index(text_index, 1)
            if tags_and_regions&.last && region_tag == tags_and_regions.last.first
              tags_and_regions.last[2] = end_text_index
            else
              tags_and_regions << [region_tag, text_index, end_text_index]
            end
          end
        end
        tags_and_regions
      end
      
      def applied_font_format_value(text_index = nil, font_option)
        text_index ||= @tk.index('insert')
        region_start = text_index
        region_end = @tk.index("#{text_index} + 1 chars")
        tag_names = applied_font_format_tags_and_regions(region_start, region_end).map(&:first)
        
        values = tag_names.map do |tag_name|
          @tk.tag_ranges(tag_name).map do |range|
            if text_index_less_than_or_equal_to_other_text_index?(range.first, region_start) && text_index_greater_than_or_equal_to_other_text_index?(range.last, region_end)
              @tk.tag_cget(tag_name, 'font')
            end
          end
        end.flatten.reject {|value| value.to_s.empty?}
        
        font = values.last
        
        value = font && font.send(font_option)
        
        value || Hash[@tk.font.actual][font_option]
      end

      def add_font_format(region_start, region_end, font_option, value)
        applied_font_format_tags_and_regions(region_start, region_end).each do |tag, tag_region_start, tag_region_end|
          if tag
            bigger_region_tag = @tk.tag_ranges(tag).any? do |range_start, range_end|
              text_index_less_than_other_text_index?(range_start, tag_region_start) || text_index_greater_than_other_text_index?(range_end, tag_region_end)
            end
            if bigger_region_tag
              @tk.tag_ranges(tag).each do |range_start, range_end|
                if text_index_less_than_other_text_index?(range_start, tag_region_start) && text_index_less_than_or_equal_to_other_text_index?(range_end, tag_region_end) && text_index_greater_than_or_equal_to_other_text_index?(range_end, tag_region_start)
                  font = @tk.tag_cget(tag, 'font')
                  remove_format(range_start, range_end, 'font', font)
                  add_format(range_start, tag_region_start, 'font', font)
                  font_clone = clone_font(font)
                  font_clone.send("#{font_option}=", value)
                  add_format(tag_region_start, tag_region_end, 'font', font_clone)
                elsif text_index_greater_than_other_text_index?(range_end, tag_region_end) && text_index_greater_than_or_equal_to_other_text_index?(range_start, tag_region_start) && text_index_less_than_or_equal_to_other_text_index?(range_start, tag_region_end)
                  font = @tk.tag_cget(tag, 'font')
                  remove_format(range_start, range_end, 'font', font)
                  add_format(tag_region_end, range_end, 'font', font)
                  font_clone = clone_font(font)
                  font_clone.send("#{font_option}=", value)
                  add_format(tag_region_start, tag_region_end, 'font', font_clone)
                elsif text_index_less_than_other_text_index?(range_start, tag_region_start) && text_index_greater_than_other_text_index?(range_end, tag_region_end)
                  font = @tk.tag_cget(tag, 'font')
                  remove_format(range_start, range_end, 'font', font)
                  add_format(range_start, tag_region_start, 'font', font)
                  remove_format(range_start, range_end, 'font', font)
                  add_format(tag_region_end, range_end, 'font', font)
                  font_clone = clone_font(font)
                  font_clone.send("#{font_option}=", value)
                  add_format(tag_region_start, tag_region_end, 'font', font_clone)
                end
              end
            else
              current_font = @tk.tag_cget(tag, 'font')
              current_font.send("#{font_option}=", value)
            end
          else
            add_format(tag_region_start, tag_region_end, 'font', default_font_attributes.merge(font_option => value))
          end
        end
      end

      def remove_font_format(region_start, region_end, font_option, value)
        applied_font_format_tags_and_regions(region_start, region_end).each do |tag, tag_region_start, tag_region_end|
          if tag
            bigger_region_tag = @tk.tag_ranges(tag).any? do |range_start, range_end|
              text_index_less_than_other_text_index?(range_start, tag_region_start) || text_index_greater_than_other_text_index?(range_end, tag_region_end)
            end
            if bigger_region_tag
              @tk.tag_ranges(tag).each do |range_start, range_end|
                if text_index_less_than_other_text_index?(range_start, tag_region_start) && text_index_less_than_or_equal_to_other_text_index?(range_end, tag_region_end) && text_index_greater_than_or_equal_to_other_text_index?(range_end, tag_region_start)
                  font = @tk.tag_cget(tag, 'font')
                  remove_format(range_start, range_end, 'font', font)
                  add_format(range_start, subtract_from_text_index(tag_region_start, 1), 'font', font)
                  font_clone = clone_font(font)
                  font_clone.send("#{font_option}=", default_for_font_option(font_option))
                  add_format(tag_region_start, tag_region_end, 'font', font_clone)
                elsif text_index_greater_than_other_text_index?(range_end, tag_region_end) && text_index_greater_than_or_equal_to_other_text_index?(range_start, tag_region_start) && text_index_less_than_or_equal_to_other_text_index?(range_start, tag_region_end)
                  font = @tk.tag_cget(tag, 'font')
                  remove_format(range_start, range_end, 'font', font)
                  add_format(add_to_text_index(tag_region_end, 1), range_end, 'font', font)
                  font_clone = clone_font(font)
                  font_clone.send("#{font_option}=", default_for_font_option(font_option))
                  add_format(tag_region_start, tag_region_end, 'font', font_clone)
                elsif text_index_less_than_other_text_index?(range_start, tag_region_start) && text_index_greater_than_other_text_index?(range_end, tag_region_end)
                  font = @tk.tag_cget(tag, 'font')
                  remove_format(range_start, range_end, 'font', font)
                  add_format(range_start, subtract_from_text_index(tag_region_start, 1), 'font', font)
                  remove_format(range_start, range_end, 'font', font)
                  add_format(add_to_text_index(tag_region_end, 1), range_end, 'font', font)
                  font_clone = clone_font(font)
                  font_clone.send("#{font_option}=", default_for_font_option(font_option))
                  add_format(tag_region_start, tag_region_end, 'font', font_clone)
                end
              end
            else
              current_font = @tk.tag_cget(tag, 'font')
              current_font.send("#{font_option}=", default_for_font_option(font_option))
            end
          else
            add_format(tag_region_start, tag_region_end, 'font', default_font_attributes.merge(font_option => default_for_font_option(font_option)))
          end
        end
      end

      # toggles option/value tag (removes if already applied)
      def toggle_font_format(region_start, region_end, option, value)
        if applied_font_format?(region_start, region_end, option, value)
          remove_font_format(region_start, region_end, option, value)
        else
          add_font_format(region_start, region_end, option, value)
        end
      end
      
      def default_for_font_option(font_option)
        @tk.font.send(font_option)
      end
      
      def default_font_attributes
        Hash[@tk.font.actual]
      end
      
      def add_to_text_index(text_index, addition)
        text_index_parts = text_index.split('.')
        line = text_index_parts.first
        char_index = text_index_parts.last
        char_index = char_index.to_i + addition
        "#{line}.#{char_index}"
      end
            
      def subtract_from_text_index(text_index, subtraction)
        add_to_text_index(text_index, -1 * subtraction)
      end
      
      def text_index_less_than_other_text_index?(region1, region2)
        region1_parts = region1.to_s.split('.')
        region2_parts = region2.to_s.split('.')
        return true if region1_parts.first.to_i < region2_parts.first.to_i
        return false if region1_parts.first.to_i > region2_parts.first.to_i
        region1_parts.last.to_i < region2_parts.last.to_i
      end
            
      def text_index_less_than_or_equal_to_other_text_index?(region1, region2)
        region1_parts = region1.to_s.split('.')
        region2_parts = region2.to_s.split('.')
        return true if region1_parts.first.to_i < region2_parts.first.to_i
        return false if region1_parts.first.to_i > region2_parts.first.to_i
        region1_parts.last.to_i <= region2_parts.last.to_i
      end
            
      def text_index_greater_than_other_text_index?(region1, region2)
        region1_parts = region1.to_s.split('.')
        region2_parts = region2.to_s.split('.')
        return true if region1_parts.first.to_i > region2_parts.first.to_i
        return false if region1_parts.first.to_i < region2_parts.first.to_i
        region1_parts.last.to_i > region2_parts.last.to_i
      end
            
      def text_index_greater_than_or_equal_to_other_text_index?(region1, region2)
        region1_parts = region1.to_s.split('.')
        region2_parts = region2.to_s.split('.')
        return true if region1_parts.first.to_i > region2_parts.first.to_i
        return false if region1_parts.first.to_i < region2_parts.first.to_i
        region1_parts.last.to_i >= region2_parts.last.to_i
      end
      
      def insert_image(text_index, *image_args)
        TkTextImage.new(@tk, 'insert', :image => image_argument(image_args))
      end
      
      def get_open_file_to_insert_image(text_index = 'insert')
        image_filename = Glimmer::DSL::Tk::BuiltInDialogExpression.new.interpret(nil, 'get_open_file', filetypes: {
          'PNG Images' => '.png',
          'Gif Images' => '.gif',
          'PPM Images' => '.ppm'
        })
        insert_image('insert', image_filename) unless image_filename.nil? || image_filename.to_s.empty?
      end
      
      private
      
      def initialize_defaults
        super
        self.font = {family: 'Courier New'}
        self.wrap = 'none'
        self.padx = 5
        self.pady = 5
      end
      
      def clone_font(font)
        ::TkFont.new(Hash[font.actual])
      end
    end
  end
end
