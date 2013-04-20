# vim: ft=ruby :
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'f', 'finish'
Pry.commands.alias_command 'w', 'whereami'
Pry.config.editor = "mvim2 -f"

#require "awesome_print"
#AwesomePrint.pry!
