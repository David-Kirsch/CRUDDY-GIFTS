class User < ActiveRecord::Base
    has_many :received, :class_name => 'Gift', :foreign_key => 'receiver_id'
    has_many :given, :class_name => 'Gift', :foreign_key => 'giver_id'
    has_many :items, through: :gifts

    def grab_all_gifts
        Gift.all.select do |gift|
           if(gift.receiver_id == self.id)
            gift
           end
        end
    end

    def see_all_gifts_received
        grab_all_gifts.map do |gift|
           "From: #{gift.giver.name} ----> Gift: #{gift.item.brand}, #{gift.item.name}"
        end
    end

    def see_all_gifts_from(user)
        see_all_gifts_received.select do |gift|
            gift.include?(user)
        end
    end

    def all_gifts_exchanged
        grab_all_gifts + self.given.map do |gift|
            gift
        end
    end

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

    def give_a_gift(person, occasion, item)
        person_instance = User.find_by(name: person)
        item_instance = Item.find_by(name: item)
        binding.pry
        Gift.create(occasion: occasion, giver_id: self.id, receiver_id: person_instance.id, item_id: item_instance.id)
    end

end