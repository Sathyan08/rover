require 'rubygems'
require 'bundler/setup'
Bundler.require

require_all 'app'

instructions = RoverTextFileInterpreter::INSTRUCTION_TEXT_FILE_PATHS[ARGV[0].to_i]
RoverTextFileInterpreter.new(instructions).process { |results| puts results }
