require 'rubygems'

Pry.config.theme = "solarized"

begin
  require 'interactive_editor'
rescue LoadError
  puts "Failed to load interactive_editor"
end

begin
  require "awesome_print"
  AwesomePrint.irb!
rescue LoadError
  puts "Failed to load awesome_print"
end

alias q exit
