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

require 'glimmer-dsl-tk'
require 'facets'
require 'fileutils'

class MetaSample
  include Glimmer
  
  attr_accessor :selected_sample_index
  
  def initialize
    @selected_sample_index = 0
  end
  
  def samples
    if @samples.nil?
      sample_files = Dir.glob(File.join(File.expand_path('../hello', __dir__), '**', 'hello_*.rb'))
      sample_file_names = sample_files.map { |f| File.basename(f, '.rb') }
      sample_file_names = sample_file_names.reject { |f| f == 'meta_sample' || f.match(/\d$/) }
      @samples = sample_file_names.map { |f| f.underscore.titlecase }
    end
    @samples
  end
  
  def file_path_for(sample)
    File.join(File.expand_path('../hello', __dir__), "#{sample.underscore}.rb")
  end
  
  def glimmer_dsl_tk_file
    File.expand_path('../../lib/glimmer-dsl-tk', __dir__)
  end
  
  def selected_sample
    samples[@selected_sample_index]
  end
  
  def run_sample(sample)
    Thread.new do
      command = "ruby -r #{glimmer_dsl_tk_file} #{sample} 2>&1"
      result = ''
      IO.popen(command) do |f|
        f.each_line do |line|
          result << line
          puts line
          $stdout.flush
        end
      end
      ::Tk.after(100) do
        message_box(parent: @root, title: 'Error Running Sample', message: result) if result.downcase.include?('error')
      end
    end
  end
  
  def launch
    @root = root {
      title 'Glimmer Meta-Sample'
      width 1280
      height 720
      
      frame {
        grid row: 0, column: 0, column_weight: 0, row_weight: 1
        
        samples.each_with_index do |sample, index|
          radiobutton {
            text sample
            variable <=> [self, :selected_sample_index, on_write: ->(v) {v ? index : selected_sample_index}, on_read: ->(v) {v == index}]
            
            on('command') do
              @selected_sample_index = index
              @code_text.value = File.read(file_path_for(selected_sample))
            end
          }
        end
        
        frame {
          button {
            grid row: 0, column: 0
            text 'Launch'
            
            on('command') do
              begin
                parent_dir = File.join(Dir.home, '.glimmer-dsl-tk', 'samples', 'hello')
                FileUtils.mkdir_p(parent_dir)
                sample_file = File.join(parent_dir, "#{selected_sample.underscore}.rb")
                File.write(sample_file, @code_text.value)
                FileUtils.cp_r(File.expand_path('../../icons', __dir__), File.dirname(File.dirname(parent_dir)))
                FileUtils.cp_r(File.expand_path('../hello/images', __dir__), parent_dir)
                sample_namespace_directory = File.expand_path("../hello/#{selected_sample.underscore}", __dir__)
                FileUtils.cp_r(sample_namespace_directory, parent_dir) if Dir.exist?(sample_namespace_directory)
                run_sample(sample_file)
              rescue => e
                puts e.full_message
                puts 'Unable to write code changes! Running original sample...'
                run_sample(file_path_for(selected_sample))
              end
            end
          }
          button {
            grid row: 0, column: 1
            text 'Reset'
            
            on('command') do
              @code_text.value = File.read(file_path_for(selected_sample))
            end
          }
        }
      }
      
      @code_text = text {
        grid row: 0, column: 1, column_weight: 1
        value File.read(file_path_for(selected_sample))
      }
    }
    @root.open
  end
end

MetaSample.new.launch
