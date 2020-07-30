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
        @@count = 0
    end
    
    def self.login
        puts "Please enter your name:"
        user_name = gets.chomp
        puts "---------------------------"
        if User.find_by(name: user_name)
            puts "Please enter your password:"
            password = gets.chomp
            puts "---------------------------"
            user_profile = User.find_by(name: user_name)
            if(user_profile.password != nil)
                if(user_profile.password == password)
                    puts "Welcome back #{user_name}!"
                    puts "---------------------------"
                else
                    puts "Sorry, you do not have the correct credentials."
                    @@count+=1
                    if(@@count >=3)
                        puts "You have exceeded the limit of tries. You can reset your password by typing in your birthday (yyyy/mm/dd)"
                        birthdate = gets.chomp
                        if(user_profile.dob == birthdate)
                            puts "Please enter a new password"
                            password = gets.chomp
                            user_profile.password = password
                            user_profile.save
                        else
                            puts "Sorry, that is not the correct birthdate."
                        end
                    end
                    self.login
                end
            else
                puts "We see you have not set a password yet. Please enter a password you would like to use for login."
                password = gets.chomp
                user_profile.password = password
                user_profile.save
                
            end
        else
            puts "You seem like a new user. Would you like to make a new profile? (y/n)"
            response = gets.chomp
            if response == "y"
                puts "Please enter your password:"
                new_pw = gets.chomp
                puts "---------------------------"
                valid = true  
                puts "Please enter your date of birth (as yyyy/mm/dd):"
                new_dob = gets.chomp
                while(valid)
                    if(new_dob.length == 10)
                        user_profile = User.create(name:user_name, dob:new_dob, password: new_pd = nil)
                        puts "---------------------------"
                        valid = false
                    else
                        puts "Please enter your date of birth (as yyyy/mm/dd):"
                        new_dob = gets.chomp
                    end
                end
            
            else
                puts "Thanks for using CRUDDY Gifts. We look forward to seeing you soon."
                puts "---------------------------"
                exit
            end
        end
        @@user << user_profile
        user_profile
    end

    def self.view_profile
        puts "Welcome to you user profile snapshot".cyan.on_black
        puts "Name: #{self.user_data.name}"
        puts "DOB: #{self.user_data.dob.year}/#{self.user_data.dob.month}/#{self.user_data.dob.day}"
        puts "Gifts Received: "
        self.user_data.see_all_gifts_received.each {|gift| puts gift}
        puts "---------------------------"
    end

    def self.view_menu
        puts "---------------------------"
        puts "What would you like to do? Please select from the options below.".cyan.on_black
        puts "1. View the gift store and go gift shopping"
        puts "2. Analyse your gift profile"
        puts "Type 'exit' to quit the program"
        puts "---------------------------"
        user_input = gets.chomp
        if(user_input.downcase == "exit")
            exit
        end
        user_input
    end






end

