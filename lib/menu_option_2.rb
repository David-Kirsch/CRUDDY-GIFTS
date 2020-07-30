require_relative './user'
require_relative './gift'
require_relative './item'
require_relative './cli_functions'
require "date"

class CLI2

    def self.summary_of_options
        puts "Please choose from the following selections:".cyan.on_black
        puts "************** GENERAL SEARCH *******************"
        puts "1. See a list of all the gifts you have received."
        puts "2. See a list of all the gifts you have given."
        puts "3. See a list of all your friends."
        puts "************** SPECIFIC SEARCH *******************"
        puts "4. Search for gifts from friend."
        puts "5. Search for gifts given to friend."
        puts "6. Search for gifts by occasion."
        puts "7. Search for gifts by category."
        selection = gets.chomp.to_i
    end

    def self.run_option2(input)
        case input
        when 1
            puts "Here is a list of all the gifts you have received:".cyan.on_black
            puts self.user_info.see_all_gifts_received
        when 2
            puts "Here is a list of all the gifts you have given:".cyan.on_black
            puts self.user_info.all_gifts_given
        when 3
            puts "Here is a list of all your friends: (Anyone you have had an exchange with)".cyan.on_black
            puts self.user_info.see_all_friends
        when 4
            puts "Please enter the name of your friend who you want to see gifts from:".cyan.on_black
            friend = gets.chomp.downcase
            puts self.user_info.see_all_gifts_from(friend)
        when 5
            puts "Please enter the name of your friend who you gave a gift to:".cyan.on_black
            friend = gets.chomp.downcase
            puts self.user_info.gifts_given_to(friend)
        when 6

            puts "Enter the occasion you are looking for gifts by: #{self.user_info.list_of_occasion_names}".cyan.on_black
            occasion = gets.chomp
            puts "Here is a list of all items that have been given for #{occasion} gifts:".cyan.on_black
            puts self.user_info.find_gift_by_occasion(occasion)
        when 7
            puts "Enter the category you are looking for gifts by: #{self.user_info.list_of_category_names}".cyan.on_black
            category = gets.chomp
            puts "Here is a list of all items that are considered #{category}:".cyan.on_black
            puts self.user_info.find_gift_by_category(category)
        end
    end  

    def self.user_info
        CLI.user_data
    end

end

