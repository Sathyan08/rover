require 'rubygems'
require 'bundler/setup'
Bundler.require

require_all 'app'

instruction_filename = RoverTextFileInterpreter::INSTRUCTION_TEXT_FILES[ARGV[0].to_i]

# Default to the first file if the user inputs an invalid index
instruction_filename ||= RoverTextFileInterpreter::INSTRUCTION_TEXT_FILES.first

puts "Processing file: #{instruction_filename}"
puts "---------------------------------"

file = File.join(RoverTextFileInterpreter::INSTRUCTIONS_DIRECTORY, instruction_filename)

RoverTextFileInterpreter.new(file).process { |results| puts results }
