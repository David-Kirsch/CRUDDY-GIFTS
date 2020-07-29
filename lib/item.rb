class Item < ActiveRecord::Base
    has_many :gifts
    has_many :users, through: :gifts


    #Sort items in store by price
    def self.price_sorted
        item_list = {}
        sorted_by_price = Item.all.sort_by{|item| item.price}
        sorted_by_price.each do |item|
            item_list[item.name] = item.price
        end
        puts "Please see existing catalogue by price (ascending):"
        puts item_list
    end

    #Filter items in store by price threshold
    def self.price_sorted_by_threshold(price_threshold)
        item_list = {}
        sorted_by_price_threshold = Item.all.sort_by{|item| item.price if item.price < price_threshold}
        sorted_by_price_threshold.each do |item|
            item_list[item.name] = item.price
        end
        puts "Please see items that are under $#{price_threshold} (ascending):"
        puts item_list
    end

    # Items by themes (sort by Group attribute)
    def self.category_sorted(category)
        item_list = {}
        sorted_by_cat = Item.select{|item| item.category == category}
        sorted_by_cat.each do |item|
            item_list[item.name] = item.price
        end
        puts "Please see items that are in the #{category} category:"
        puts item_list
    end

    # Find items by name
    def self.find_by_name(name)
        item_list = {}
        sorted_by_name = Item.select{|item| item.name if item.name.include?(name)}
        sorted_by_name.each do |item|
            item_list[item.name] = item.price
        end
        puts "Please see items that match your search words '#{name}':"
        puts item_list
    end

    #See whether this item has been given as a gift

    def self.gifts_not_given_yet
        gifts_not_given = Gift.select{|gift| gift.name if gift.popularity_count == 0}
        "The following items have not been given yet : #{gifts_not_given}"
    end

end
