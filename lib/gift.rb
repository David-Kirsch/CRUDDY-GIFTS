class Gift < ActiveRecord::Base
    belongs_to :giver, :class_name => 'User', :foreign_key => 'giver_id'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_id'
    belongs_to :item

    #Lists items by category
    def self.item_by_category(category)
        item_by_category = Item.select{|item| item.name if item.category == category}
        puts "The list of #{category} items available are:"
        puts item_by_category
    end
    
    # Gives names if people who have given or received specific instance of tha that Gift
    def gifts_given
        given_items = Gift.all.map{|gift| gift.giver.name if gift.item_id == self.id}.compact.join("")
        puts "People who have given this gift: #{given_items}"
    end
    
    def gifts_received
        received_items = Gift.all.map{|gift| gift.receiver.name if gift.item_id == self.id}.compact.join("")
        puts "People who have received this gift: #{received_items}"
    end


    # Counts how popular a specific instance of the gift is
    def popularity
        counter = Gift.all.count do |gift|
            gift.item_id==self.item_id
            binding.pry
        end 
        puts "This gift has been given/received #{counter} time(s)."
    end
    
    # Finds most popular gift given
    def self.most_popular_gift
        pop_gift = Gift.all.max_by{|gift| gift.popularity}
        puts "The most popular gift is #{pop_gift.item.name}."
    end
    
    # Finds the most popular gift in a given category
    def self.most_popular_gift_by_category(category)
        pop_gift_by_cat = Gift.all.max_by{|gift| gift.popularity if gift.item.category == category}
        puts "The most popular gift in the #{category} category is #{pop_gift_by_cat.item.name}."
    end

    # Gives the most popular occasion to give a gift
    def self.most_popular_occasion
        pop_occasion = Gift.all.max_by{|gift| gift.occasion}
        puts "The most popular occasion is #{pop_occasion.occasion.pluralize}."
    end

    #Lists all the gifts given/received for that occasion
    def self.gifts_by_occasion(occasion)
        gift_occasion = Gift.all.map{|gift| gift.item.name if gift.occasion = occasion}.compact.uniq.join("")
        puts "These were the gifts given for #{occasion.pluralize}: #{gift_occasion}."
    end

    def popularity_count
        Gift.count{|gift| self.item_id == gift.item_id}
    end
    

end