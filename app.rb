require 'rubygems'
require 'bundler/setup'
Bundler.require

require_all 'app'

instruction_filename = RoverTextFileInterpreter::INSTRUCTION_TEXT_FILES[ARGV[0].to_i]
file = File.join(RoverTextFileInterpreter::INSTRUCTIONS_DIRECTORY, instruction_filename)

RoverTextFileInterpreter.new(file).process { |results| puts results }
