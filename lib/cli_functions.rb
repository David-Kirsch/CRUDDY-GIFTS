require_relative './user'
require_relative './gift'
require_relative './item'


class CLI < ActiveRecord::Base

    @@user = []

    def self.user_data
        @@user.first
    end
    
    def self.welcome
         puts"
                                                                                                                                
                                                                                                                         
            CCCCCCCCCCCCCRRRRRRRRRRRRRRRRR   UUUUUUUU     UUUUUUUUDDDDDDDDDDDDD     DDDDDDDDDDDDD       YYYYYYY       YYYYYYY
         CCC::::::::::::CR::::::::::::::::R  U::::::U     U::::::UD::::::::::::DDD  D::::::::::::DDD    Y:::::Y       Y:::::Y
       CC:::::::::::::::CR::::::RRRRRR:::::R U::::::U     U::::::UD:::::::::::::::DDD:::::::::::::::DD  Y:::::Y       Y:::::Y
      C:::::CCCCCCCC::::CRR:::::R     R:::::RUU:::::U     U:::::UUDDD:::::DDDDD:::::DDD:::::DDDDD:::::D Y::::::Y     Y::::::Y
     C:::::C       CCCCCC  R::::R     R:::::R U:::::U     U:::::U   D:::::D    D:::::DD:::::D    D:::::DYYY:::::Y   Y:::::YYY
    C:::::C                R::::R     R:::::R U:::::D     D:::::U   D:::::D     D:::::D:::::D     D:::::D  Y:::::Y Y:::::Y   
    C:::::C                R::::RRRRRR:::::R  U:::::D     D:::::U   D:::::D     D:::::D:::::D     D:::::D   Y:::::Y:::::Y    
    C:::::C                R:::::::::::::RR   U:::::D     D:::::U   D:::::D     D:::::D:::::D     D:::::D    Y:::::::::Y     
    C:::::C                R::::RRRRRR:::::R  U:::::D     D:::::U   D:::::D     D:::::D:::::D     D:::::D     Y:::::::Y      
    C:::::C                R::::R     R:::::R U:::::D     D:::::U   D:::::D     D:::::D:::::D     D:::::D      Y:::::Y       
    C:::::C                R::::R     R:::::R U:::::D     D:::::U   D:::::D     D:::::D:::::D     D:::::D      Y:::::Y       
     C:::::C       CCCCCC  R::::R     R:::::R U::::::U   U::::::U   D:::::D    D:::::DD:::::D    D:::::D       Y:::::Y       
      C:::::CCCCCCCC::::CRR:::::R     R:::::R U:::::::UUU:::::::U DDD:::::DDDDD:::::DDD:::::DDDDD:::::D        Y:::::Y       
       CC:::::::::::::::CR::::::R     R:::::R  UU:::::::::::::UU  D:::::::::::::::DDD:::::::::::::::DD      YYYY:::::YYYY    
         CCC::::::::::::CR::::::R     R:::::R    UU:::::::::UU    D::::::::::::DDD  D::::::::::::DDD        YYYYYYYYYYYYY ".cyan.on_black 
  puts "             CCCCCGGGGGGGGGGGGGIIIIIIIIIIFFFFFFFFFFFFFFFFFFFFFFTTTTTTTTTTTTTTTTTTTTTTTDDDSSSSSSSSSSSSSSS                                                     GGG::::::::::::GI::::::::IF::::::::::::::::::::FT:::::::::::::::::::::T SS:::::::::::::::S                     
            GG:::::::::::::::GI::::::::IF::::::::::::::::::::FT:::::::::::::::::::::TS:::::SSSSSS::::::S                     
           G:::::GGGGGGGG::::GII::::::IIFF::::::FFFFFFFFF::::FT:::::TT:::::::TT:::::TS:::::S     SSSSSSS                     
          G:::::G       GGGGGG  I::::I    F:::::F       FFFFFFTTTTTT  T:::::T  TTTTTTS:::::S                                 
         G:::::G                I::::I    F:::::F                     T:::::T        S:::::S                                 
         G:::::G                I::::I    F::::::FFFFFFFFFF           T:::::T         S::::SSSS                              
         G:::::G    GGGGGGGGGG  I::::I    F:::::::::::::::F           T:::::T          SS::::::SSSSS                         
         G:::::G    G::::::::G  I::::I    F:::::::::::::::F           T:::::T            SSS::::::::SS                       
         G:::::G    GGGGG::::G  I::::I    F::::::FFFFFFFFFF           T:::::T               SSSSSS::::S                      
         G:::::G        G::::G  I::::I    F:::::F                     T:::::T                    S:::::S                     
          G:::::G       G::::G  I::::I    F:::::F                     T:::::T                    S:::::S                     
           G:::::GGGGGGGG::::GII::::::IIFF:::::::FF                 TT:::::::TT      SSSSSSS     S:::::S                     
            GG:::::::::::::::GI::::::::IF::::::::FF                 T:::::::::T      S::::::SSSSSS:::::S                     
              GGG::::::GGG:::GI::::::::IF::::::::FF                 T:::::::::T      S:::::::::::::::SS                      
                 GGGGGG   GGGGIIIIIIIIIIFFFFFFFFFFF                 TTTTTTTTTTT       SSSSSSSSSSSSSSS                        
                                                                                                                             
                                                                                                                             
        ".magenta.on_black

    end
    
    def self.login
        puts "Please enter your name:"
        user_name = gets.chomp
        puts "---------------------------"
        if User.find_by(name: user_name)
            puts "Please enter your password:"
            password = gets.chomp
            user_profile = User.find_by(name: user_name)
            if(user_profile.password == password)
                puts "Welcome back #{user_name}!"
                puts "---------------------------"
            else
                puts "Sorry, you do not have the correct credentials."
                self.login
            end
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

