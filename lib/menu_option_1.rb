require_relative './user'
require_relative './gift'
require_relative './item'
require_relative './cli_functions'



class CLI1

    def summary_of_options
        puts "Please see below for Gift Store services: "
        puts "1. View the whole gift store"
        puts "2. Find gifts within your budget"
        puts "3. Find gifts by category"
        puts "4. Find a certain gift by name"
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

#Option 2

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

end
