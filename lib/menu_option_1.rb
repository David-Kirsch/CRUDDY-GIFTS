require_relative './user'
require_relative './gift'
require_relative './item'
require_relative './cli_functions'



class CLI1

    def summary_of_options
        puts "Please choose from the following selections:"
        puts "************** GENERAL SEARCH *******************"
        puts "1. View the whole gift store"
        puts "2. Find gifts within your budget"
        puts "3. Find gifts by category"
        puts "4. Find a certain gift by name"
        puts "************** SPECIFIC SEARCH *******************"
        puts "5. See upcoming birthdays (in the next 3 months)"
        puts "6. Give a gift to a friend"

        user_input = gets.chomp
    end


# Option 1

    def self.view_gift_store
        puts "CRUDDY Gifts Store Item List"
        Gift.all.each do |gift|
            puts "Gift Name: #{gift.name}"
            puts "Gift Brand: #{gift.brand}"
            puts "Price: #{gift.price}"
            puts "Product Description: #{gift.description}"
            puts "Press enter to see next product."
            next_item = gets.chomp
        end
    end

# Option 2

    def self.find_gifts_in_budget
        puts "CRUDDY Gifts Budget Filter. Please type 'exit'" 
        puts "to leave this page and head back to to the option menu."
        puts "Please enter your gift budget:"
        price_budget = gets.chomp
        if price_budget != "exit"
            price_budget = price_budget.to_i
            Gift.price_sorted_by_threshold(price_budget)
        else
            "Thanks for using CRUDDY gifts. See you again!"
        end
    end

# Option 3

    def self.find_gifts_in_category
        puts "CRUDDY Gifts Category Filter. Please type 'exit'" 
        puts "to leave this page and head back to to the option menu."
        puts "Please enter your gift category:"
        gift_category = gets.chomp
        if gift_category != "exit"
            Gift.category_sorted(gift_category)
        else
            "Thanks for using CRUDDY gifts. See you again!"
        end
    end

# Option 4

    def self.find_gifts_by_name
        puts "CRUDDY Gifts Search Filter. Please type 'exit'" 
        puts "to leave this page and head back to to the option menu."
        puts "Please enter your gift name or keywords:"
        gift_name = gets.chomp
        if gift_name != "exit"
            Gift.find_by_name(gift_name)
        else
            "Thanks for using CRUDDY gifts. See you again!"
        end
    end

# Option 5

    def self.upcoming_birthday
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

    def give_birthday_gift
        puts "Please enter the name of a friend you want to send a gift to: "
        friend_name = gets.chomp
        if User.find_by(name: friend_name)
            friend_profile = User.all.select{|user| user.name == friend_name}
            puts "Please enter the name of the gift you would like to give: "
            gift_name = gets.chomp

        else
            puts "You seem like a new user. Would you like to make a new profile? (y/n)"
            response = gets.chomp
            if response == "y"
                puts "Please enter your password:"
                new_pw = gets.chomp
                puts "Please enter you date of birthday (as yyyymmdd): "
                new_dob = gets.chomp.to_i
                user_profile = User.create(name:user_name, dob:new_dob)
    end 


end
