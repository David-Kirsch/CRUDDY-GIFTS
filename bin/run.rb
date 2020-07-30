require_relative '../config/environment'
require "pry"

CLI.welcome
user = CLI.login
CLI.view_profile
while true do
    selection1 = CLI.view_menu.to_i  
    if selection1 == 1
        selection2 = CLI1.summary_of_options.to_i
        CLI1.run_option1(selection2)
        puts "Please enter to continue or type 'exit' to exit program".red
        exit_call = gets.chomp
        if exit_call == "exit"
            return false
        end
    end
    if selection1 == 2
        selection2 = CLI2.summary_of_options.to_i
        CLI2.run_option2(selection2)
        puts "Please enter to continue or type 'exit' to exit program".red
        exit_call = gets.chomp
        if exit_call == "exit"
            return false
        end
    end
end