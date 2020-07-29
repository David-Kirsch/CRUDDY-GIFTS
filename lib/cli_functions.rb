# require_relative './user'
# require_relative './gift'
# require_relative './item'


class CLI
    
    def self.welcome
        puts "Welcome to the CRUDDY Gifts!"
    end
    
    def self.homescreen
        self.login
        self.view_profile
    end

    def go_shopping

    end






# Sub-methods for compiled CLI master methods

    def self.login
        puts "Please enter your username:"
        user_name = gets.chomp
        puts "Please enter your password:"
        password = gets.chomp
        if User.all.name.include?(user_name)
            puts "Welcome back!"
        else
            puts "You seem like a new user. Would you like to make a new profile? (y/n)"
            response = gets.chomp
            if response == "y"
                puts "Please enter your password:"
                new_pw = gets.chomp
                puts "Please enter you date of birthday (as mmddyyyy): "
                new_dob = gets.chomp
                if(new_dob[0] == '0')
                    new_dob = '1'+ new_dob
                end
                binding.pry
                new_user = User.create(name:user_name, dob:new_dob.to_i)
            else
                puts "Thanks for using CRUDDY Gifts. We look forward to seeing you soon."
            end
        end
    end

    def view_profile
        puts "Welcome to you user profile snapshot"
        puts "Name: #{self.name}"
        puts "DOB: #{self.dob}"
        puts "Gifts Received: #{self.see_all_gifts_received}"
    end

    def view_menu
        puts "What would you like to do? Please select from the options below."
        puts "1. View the gift store"
        puts "2. View an upcoming birthday"
        puts "3. Analyse your gift profile"
        user_input = gets.chomp
    end


end

