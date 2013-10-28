require 'rubygems'

Pry.config.theme = "solarized"

begin
  require 'interactive_editor'
rescue LoadError
end

begin
  require "awesome_print"
  AwesomePrint.irb!
end

alias q exit
