require_relative './user'
require_relative './gift'
require_relative './item'


class CLI < ActiveRecord::Base

    @@user = []

    def self.user_data
        @@user.first
    end
    
    def self.welcome
        puts "---------------------------"
        puts "Welcome to the CRUDDY Gifts!"
        puts "---------------------------"

    end
    
    def self.login
        puts "Please enter your name:"
        user_name = gets.chomp
        puts "---------------------------"
        if User.find_by(name: user_name)
            puts "Please enter your password:"
            password = gets.chomp
            user_profile = User.find_by(name: user_name)
            puts "Welcome back #{user_name}!"
            puts "---------------------------"
        else
            puts "You seem like a new user. Would you like to make a new profile? (y/n)"
            response = gets.chomp
            if response == "y"
                puts "Please enter your password:"
                new_pw = gets.chomp
                puts "Please enter you date of birthday (as yyyy/mm/dd):"
                new_dob = gets.chomp
                user_profile = User.create(name:user_name, dob:new_dob)
                puts "---------------------------"
            else
                puts "Thanks for using CRUDDY Gifts. We look forward to seeing you soon."
                puts "---------------------------"
            end
        end
        @@user << user_profile
        user_profile
    end

    def self.view_profile
        puts "---------------------------"
        puts "Welcome to you user profile snapshot"
        puts "Name: #{self.user_data.name}"
        puts "DOB: #{self.user_data.dob.year}/#{self.user_data.dob.month}/#{self.user_data.dob.day}"
        puts "Gifts Received: #{self.user_data.see_all_gifts_received}"
        puts "---------------------------"
    end

    def self.view_menu
        puts "What would you like to do? Please select from the options below."
        puts "1. View the gift store and go gift shopping"
        puts "2. Analyse your gift profile"
        puts "---------------------------"
        user_input = gets.chomp
        user_input
    end






end

