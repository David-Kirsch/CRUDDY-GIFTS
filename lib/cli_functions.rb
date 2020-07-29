require_relative './user'
require_relative './gift'
require_relative './item'


class CLI < ActiveRecord::Base

    @@all = []

    def self.user_data
        @@user
    end
    
    def self.welcome
        puts "Welcome to the CRUDDY Gifts!"
    end
    
    def self.login
        puts "Please enter your name:"
        user_name = gets.chomp
        puts "Please enter your password:"
        password = gets.chomp
        if User.find_by(name: user_name)
            user_profile = User.all.select{|user| user.name == user_name}
            puts "Welcome back #{user_name}!"
        else
            puts "You seem like a new user. Would you like to make a new profile? (y/n)"
            response = gets.chomp
            if response == "y"
                puts "Please enter your password:"
                new_pw = gets.chomp
                puts "Please enter you date of birthday (as yyyymmdd): "
                new_dob = gets.chomp.to_i
                user_profile = User.create(name:user_name, dob:new_dob)
            else
                puts "Thanks for using CRUDDY Gifts. We look forward to seeing you soon."
            end
        end
        @@all << user_profile
        user_profile
    end

    def self.view_profile
        puts "Welcome to you user profile snapshot"
        puts "Name: #{self.user_data.name}"
        puts "DOB: #{self.user_data.dob}"
        puts "Gifts Received: #{self.user_data.see_all_gifts_received}"
    end

    def self.view_menu
        puts "What would you like to do? Please select from the options below."
        puts "1. View the gift store"
        puts "2. View an upcoming birthday and give a gift"
        puts "3. Analyse your gift profile"
        user_input = gets.chomp
        user_input
    end






end
