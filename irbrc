require 'rubygems'

begin
  require 'interactive_editor'
rescue LoadError
end

begin
  require "awesome_print"
  AwesomePrint.irb!
end

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT] = true

alias q exit
