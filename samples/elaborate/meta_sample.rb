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
      sample_files = Dir.glob(File.join(File.expand_path('../hello', __dir__), '**', '*.rb'))
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
    File.expand_path('../lib/glimmer-dsl-tk', __dir__)
  end
  
  def selected_sample
    samples[@selected_sample_index]
  end
  
  def run_sample(sample)
    command = "ruby -r #{glimmer_dsl_tk_file} #{sample} 2>&1"
    result = ''
    IO.popen(command) do |f|
      f.each_line do |line|
        result << line
        puts line
      end
    end
    msg_box('Error Running Sample', result) if result.downcase.include?('error')
  end
  
  def launch
    root {
      title 'Meta-Sample'
      width 700
      height 500
      
      frame {
        grid row: 0, column: 0
        
        samples.each_with_index do |sample, index|
          radiobutton {
            text sample
            variable <=> [self, :selected_sample_index, on_write: ->(v) {v ? index : selected_sample_index}, on_read: ->(v) {v == index}]
            
            on('command') do
              @selected_sample_index = index
              @code_entry.text = File.read(file_path_for(selected_sample))
            end
          }
        end
        
        frame {
          button {
            grid row: 0, column: 0
            text 'Launch'
            
            on('command') do
              begin
                parent_dir = File.join(Dir.home, '.glimmer-dsl-tk', 'samples')
                FileUtils.mkdir_p(parent_dir)
                sample_file = File.join(parent_dir, "#{selected_sample.underscore}.rb")
                File.write(sample_file, @code_entry.text)
                FileUtils.cp_r(File.expand_path('../icons', __dir__), File.dirname(parent_dir))
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
              @code_entry.text = File.read(file_path_for(selected_sample))
            end
          }
        }
      }
      
      @code_text = entry { # TODO switch to text widget
        grid row: 0, column: 1
        text File.read(file_path_for(selected_sample))
      }
    }.open
  end
end

MetaSample.new.launch
