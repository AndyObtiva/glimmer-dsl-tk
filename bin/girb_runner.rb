require 'puts_debuggerer'
require 'fileutils'
require 'etc'

require_relative '../lib/glimmer-dsl-tk'

include Glimmer

GIRB_RUNNER_EXIT_FILE = "#{Etc.getpwuid.dir}/.girb_runner_exit"
FileUtils.rm_rf GIRB_RUNNER_EXIT_FILE

@exit_method = method(:exit)

@exit_girb_block = lambda do
  FileUtils.touch GIRB_RUNNER_EXIT_FILE
end

def self.exit(*args)
  @exit_girb_block.call
  @exit_method.call(*args)
end

def self.quit(*args)
  @exit_girb_block.call
  @exit_method.call(*args)
end
