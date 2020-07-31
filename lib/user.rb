class User < ActiveRecord::Base
    has_many :received, :class_name => 'Gift', :foreign_key => 'receiver_id'
    has_many :given, :class_name => 'Gift', :foreign_key => 'giver_id'
    has_many :items, through: :gifts

    #gets all instances of received gifts
    def grab_all_gifts
        Gift.all.select do |gift|
           if(gift.receiver_id == self.id)
            gift
           end
        end
    end

    #all gifts given
    def gifts_given
        Gift.all.select do |gift|
            if(gift.giver_id == self.id)
                gift
            end
        end
    end

    def delete_self
        all_gifts_exchanged.each do |gift|
            gift.destroy
        end
        self.destroy
    end
  

    #get the values from instances of #grab_all_gifts
    def see_all_gifts_received
        grab_all_gifts.map do |gift|
            "◆".cyan+"From #{gift.giver.name}: #{gift.item.brand}-#{gift.item.name}\n   Occasion: #{gift.occasion}"
        end
    end

    #see all the gifts from a specific user
    def see_all_gifts_from(user)
        see_all_gifts_received.select do |gift|
            gift.downcase.include?(user)
        end
    end

    #grabs all the user instances that the user had an exchange with
    def all_gifts_exchanged
        Gift.all.select do |gift|
            if(gift.receiver_id == self.id|| gift.giver_id == self.id)
                gift
            end
        end
    end

    #lists all the gifts that has been given
    def all_gifts_given
        gifts_given.map do |gift|
          "◆".cyan+" To #{gift.receiver.name}: #{gift.item.brand}-#{gift.item.name}, \n  Occasion #{gift.occasion}, Price: $#{gift.item.price}"
        end
    end

    #lists all the gifts given to a specific person
    def gifts_given_to(person)
        all_gifts_given.select do |gift|
            if(gift.downcase.include?(person))
                gift
            end
        end
    end

    #grabs all the names of the users who had an exchange
    def see_all_friends
        my_name = self.name
        givers = all_gifts_exchanged.map do |gift|
            "#{gift.giver.name}"
        end
        friends = givers + all_gifts_exchanged.map do |gift|
            "#{gift.receiver.name}"
        end
        friends.delete(my_name)
        friends.uniq
    end

    #give a gift to someone
    def give_a_gift
        puts "Please enter the name of a friend you want to send a gift to: "
        friend_name = gets.chomp
        if User.find_by(name: friend_name)
            friend_profile = User.find_by(name: friend_name)
        else
            puts "❗️Receipient not found."+ "\nUser: #{friend_name} has now been added to the database.".green.bold
                friend_profile = User.create(name: friend_name, dob:"9123/12/12")
        end
        chosen_gift = CLI1.find_items_by_name
        if(chosen_gift[0] == nil)
            puts "❌Sorry, that item was not found. Please look at the gift store and then return back here."
            CLI1.view_gift_store
        else
            puts "Enter the occasion for the gift:"
            gift_occasion = gets.chomp
            Gift.create(occasion: gift_occasion, giver_id: self.id, receiver_id: friend_profile.id, item_id: chosen_gift[0].id)
            puts "You have given #{friend_name} a(n) #{chosen_gift.first.name} as a #{gift_occasion} gift!🎁"
        end
    end

    #grabs all the Gift instances by the occasion attr
    def find_instances_by_occasion(occ)
        all_gifts_exchanged.select do |gift|
            if(gift.occasion.downcase == occ.downcase)
                gift
            end
        end
    end

    #grab all the occasion names
    def list_of_occasion_names
        all_gifts_exchanged.map do |gift|
            gift.occasion
        end.uniq
    end

    #list the values from the Gift instances by occasion attr
    def find_gift_by_occasion(occ)
        find_instances_by_occasion(occ).map do |gift|
            "#{gift.item.brand} - #{gift.item.name} : $#{gift.item.price}"
        end.uniq
    end

    #grabs the instances of gifts by the Item category
    def find_instance_by_category(cat)
        all_gifts_exchanged.select do |gift|
            if(gift.item.category.downcase == cat.downcase)
                gift
            end
        end
    end

    #list all category names
    def list_of_category_names
        all_gifts_exchanged.map do |gift|
            gift.item.category
        end.uniq
    end

    #lists the gifts given/received by item category
    def find_gift_by_category(cat)
        find_instance_by_category(cat).map do |gift|
            "#{gift.item.brand} - #{gift.item.name} : $#{gift.item.price}"
        end.uniq
    end

    def age(dob)
        now = Time.now
        user_age = now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= self.dob.day)) ? 0 : 1)
        user_age
    end

end