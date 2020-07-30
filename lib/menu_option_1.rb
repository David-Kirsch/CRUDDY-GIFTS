require_relative './user'
require_relative './gift'
require_relative './item'
require_relative './cli_functions'
require "date"




class CLI1

# Option Master Menu and Executable Commands

    def self.summary_of_options
        puts "Please choose from the following selections:"
        puts "************** GENERAL SEARCH *******************"
        puts "1. View the whole gift store"
        puts "2. Find gifts within your budget"
        puts "3. Find gifts by category"
        puts "4. Find a gift by name"
        puts "************** SPECIFIC SEARCH *******************"
        puts "5. See upcoming birthdays (in the next 3 months)"
        puts "6. Give a gift to a friend"
        user_input = gets.chomp
    end

    def self.run_option1(input)
        case input
        when 1
            self.view_gift_store
        when 2
            self.find_items_in_budget
        when 3
            self.find_items_in_category
        when 4
            self.find_items_by_name
        when 5
            self.upcoming_birthday
        when 6
            self.user_info.give_a_gift
        end
    end

#Supporting Methods for each case

    def self.user_info
        CLI.user_data
    end

# Option 1

    def self.view_gift_store
        puts "---------------------------"
        puts "CRUDDY Gifts Store Item List"
        Item.all.each do |item|
            Item.output_formatted(item)
        end
    end

# Option 2

    def self.find_items_in_budget
        puts "---------------------------"
        puts "CRUDDY Gifts Budget Filter" 
        puts "Please enter your gift budget:"
        price_budget = gets.chomp
        if price_budget != "exit"
            price_budget = price_budget.to_f
            Item.price_sorted_by_threshold(price_budget)
        else
            "Thanks for using CRUDDY gifts. See you again!"
        end
    end

# Option 3

    def self.find_items_in_category
        puts "---------------------------"
        puts "CRUDDY Gifts Category Filter" 
        puts "Please enter your gift category:"
        gift_category = gets.chomp
        if gift_category != "exit"
            Item.category_sorted(gift_category)
        else
            "Thanks for using CRUDDY gifts. See you again!"
        end
    end

# Option 4

    def self.find_items_by_name
        puts "---------------------------"
        puts "CRUDDY Gifts Search Filter" 
        puts "Please enter your gift name or keywords:"
        gift_name = gets.chomp
        if gift_name != "exit"
            Item.find_by_name(gift_name)
        else
            "Thanks for using CRUDDY gifts. See you again!"
        end
    end

# Option 5

    def self.upcoming_birthday
        puts "---------------------------"
        now = Time.now
        upcoming_birthdays = User.all.select{|user| user.dob.month > now.month && user.dob.month - now.month < 3}
        upcoming_birthdays = upcoming_birthdays.sort_by{|birthday| birthday.dob.month}
        upcoming_birthdays.each do |birthday|
            puts "Name: #{birthday.name}"
            puts "Birthday: #{birthday.dob.month}/#{birthday.dob.day}"
            puts "Age: #{birthday.age(birthday.dob)}" 
            puts "---------------------------"
        end
    end

# Option 6

#>> In User class


end
