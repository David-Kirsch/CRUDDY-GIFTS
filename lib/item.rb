class Item < ActiveRecord::Base
    has_many :gifts
    has_many :users, through: :gifts


    # #Sort items in store by price
    # def self.price_sorted
    #     sorted_by_price = Item.all.sort_by{|item| item.price}
    #     sorted_by_price.each do |item|
    #         Item.output_formatted(item)
    #     end
    #     puts "Please see existing catalogue by price (ascending):"
    # end

    #Filter items in store by price threshold
    def self.price_sorted_by_threshold(price_threshold)
        sorted_by_price_threshold = Item.all.select{|item| item.price if item.price < price_threshold}
        puts "Please see items that are under $#{price_threshold}:"
        sorted_by_price_threshold.each do |item|
            Item.output_formatted(item)
        end
    end

    # Items by themes (sort by Group attribute)
    def self.category_sorted(category)
        sorted_by_cat = Item.select{|item| item.category == category}
        puts "Please see items that are in the #{category} category:"
        sorted_by_cat.each do |item|
            Item.output_formatted(item)
        end
    end

    # Find items by name
    def self.find_by_name(item_name)
        item_list = []
        Item.all.each do |item|
            if item.description.include?(item_name)
                item_list << item
            end
        end
        puts "Please see items that match your search words '#{item_name}':"
        item_list.each do |item|
            Item.output_formatted(item)
        end
    end

    def self.output_formatted(item)
        puts "---------------------------"
        puts "Gift Name: #{item.name}"
        puts "Gift Brand: #{item.brand}"
        puts "Price: $#{item.price}"
        puts "Product Description: #{item.description}"
        puts "Press enter to see next product."
        puts "---------------------------"
        next_item = gets.chomp
    end



end
