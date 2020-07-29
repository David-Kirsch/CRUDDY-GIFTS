require_relative './user'
require_relative './gift'
require_relative './item'
require_relative './cli_functions'
require "date"

class CLI2

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

    def give_birthday_gift
    end 







end