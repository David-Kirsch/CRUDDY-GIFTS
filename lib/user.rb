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

    #get the values from instances of #grab_all_gifts
    def see_all_gifts_received
        grab_all_gifts.map do |gift|
           "From #{gift.giver.name}: #{gift.item.brand} - #{gift.item.name}"
        end
    end

    #see all the gifts from a specific user
    def see_all_gifts_from(user)
        see_all_gifts_received.select do |gift|
            gift.include?(user)
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
        self.given.map do |gift|
            "To #{gift.receiver.name}: #{gift.item.brand} - #{gift.item.name}"
        end
    end

    #lists all the gifts given to a specific person
    def gifts_given_to(person)
        all_gifts_given.select do |gift|
            if(gift.downcase.include?(person.downcase))
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
    def give_a_gift(person, occasion, item)
        person_instance = User.find_by(name: person)
        item_instance = Item.find_by(name: item)
        binding.pry
        Gift.create(occasion: occasion, giver_id: self.id, receiver_id: person_instance.id, item_id: item_instance.id)
    end

    #grabs all the Gift instances by the occasion attr
    def find_instances_by_occasion(occ)
        all_gifts_exchanged.select do |gift|
            if(gift.occasion.downcase == occ.downcase)
                gift
            end
        end
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

    #lists the gifts given/received by item category
    def find_gift_by_category(cat)
        find_instance_by_category(cat).map do |gift|
            "#{gift.item.brand} - #{gift.item.name} : $#{gift.item.price}"
        end.uniq
    end
end