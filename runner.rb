#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('app', __dir__)

require 'command_line_interface'

CommandLineInterface.new.run
