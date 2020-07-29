require_relative '../config/environment'


CLI.welcome
CLI2.upcoming_birthday
CLI.login
CLI.all[0].view_profile
home_menu_option = CLI.view_menu
if home_menu_option == "1"
    option1_menu = CLI1.summary_of_options
end
if home_menu_option == "2"
    #Body
end
if home_menu_option == "3"
    #Body
end



puts "HELLO WORLD"
