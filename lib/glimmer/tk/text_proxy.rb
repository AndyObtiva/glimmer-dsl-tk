# Copyright (c) 2020-2021 Andy Maleh
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
      def handle_listener(listener_name, &listener)
        listener_name = listener_name.to_s.downcase
        case listener_name
        when '<<modified>>', '<modified>', 'modified'
          modified_listener = Proc.new do |*args|
            listener.call(*args)
            @tk.modified = false
          end
          bind('<Modified>', modified_listener)
        when '<<selection>>', '<selection>', 'selection'
          bind('<Selection>', listener)
        else
          super
        end
      end
    
      def text=(value)
        if value != @text
          if @text && value.start_with?(@text)
            insert('end', value[@text.size..-1])
          else
            delete('1.0', 'end')
            insert('end', value)
          end
          @text = value
        end
      end
      
      def text
        @text = get("1.0", 'end')
      end
      
      def add_selection_format(option, value)
        process_selection_ranges { |range_start, range_end| add_format(range_start, range_end, option, value) }
      end
      
      def remove_selection_format(option, value)
        process_selection_ranges { |range_start, range_end| remove_format(range_start, range_end, option, value) }
      end
      
      def toggle_selection_format(option, value)
        process_selection_ranges { |range_start, range_end| toggle_format(range_start, range_end, option, value) }
      end
      
      def add_selection_font_format(option, value)
        process_selection_ranges { |range_start, range_end| add_font_format(range_start, range_end, option, value) }
      end
      
      def remove_selection_font_format(option, value)
        process_selection_ranges { |range_start, range_end| remove_font_format(range_start, range_end, option, value) }
      end
      
      def toggle_selection_font_format(option, value)
        process_selection_ranges { |range_start, range_end| toggle_font_format(range_start, range_end, option, value) }
      end
      
      def process_selection_ranges(&processor)
        @tk.tag_ranges('sel').each do |region|
          range_start = region.first
          range_end = region.last
          processor.call(range_start, range_end)
        end
      end
      
      def applied_format?(region_start, region_end, option, value)
        !applied_format_tags(region_start, region_end, option, value).empty?
      end
      
      def applied_format_tags(region_start, region_end, option, value)
        tag_names = @tk.tag_names - ['sel']
        
        tag_names.select do |tag_name|
          @tk.tag_ranges(tag_name).any? do |range|
            if range.first.to_f <= region_start.to_f && range.last.to_f >= region_end.to_f
              @tk.tag_cget(tag_name, option) == value
            end
          end
        end
      end
            
      def add_format(region_start, region_end, option, value)
        @@tag_number = 0 unless defined?(@@tag_number)
        tag = "tag#{@@tag_number += 1}"
        @tk.tag_configure(tag, {option => value})
        @tk.tag_add(tag, region_start, region_end)
        tag
      end
      
      def remove_format(region_start, region_end, option, value)
        partial_intersection_option_applied_tags = tag_names.select do |tag_name|
          @tk.tag_ranges(tag_name).any? do |range|
            if range.first.to_f.between?(region_start.to_f, region_end.to_f) or
               range.last.to_f.between?(region_start.to_f, region_end.to_f) or
               (range.first.to_f <= region_start.to_f && range.last.to_f >= region_end.to_f)
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
            
#       def applied_font_format?(region_start, region_end, option, value)
#         !applied_font_format_tags(region_start, region_end, option, value).empty?
#       end
#
#       def applied_font_format_tags(region_start, region_end, option, value)
#         tag_names = @tk.tag_names - ['sel']
#
#         tag_names.select do |tag_name|
#           @tk.tag_ranges(tag_name).any? do |range|
#             if range.first.to_f <= region_start.to_f && range.last.to_f >= region_end.to_f
#               @tk.tag_cget(tag_name, option) == value
#             end
#           end
#         end
#       end
#
#       def add_font_format(region_start, region_end, option, value)
#       end
#
#       def remove_font_format(region_start, region_end, option, value)
#       end
#
      ### toggles option/value tag (removes if already applied)
#       def toggle_font_format(region_start, region_end, option, value)
#         if applied_font_format?(region_start, region_end, option, value)
          ### ensure removing from previous font combination (perhaps checking widget font too)
#           remove_font_format(region_start, region_end, option, value)
#         else
          ### ensure adding to previous font combination (perhaps checking widget font too)
#           add_font_format(region_start, region_end, option, value)
#         end
#       end
            
      private
      
      def initialize_defaults
        super
        self.padx = 5
        self.pady = 5
      end
    end
  end
end
