class Item < ActiveRecord::Base
    has_many :gifts
    has_many :users, through: :gifts


    #Potential Methods to Build
    
    #1. (Class) Find all items purchased by a user
    
    #2. (Instance) Most frequent gift shopper/receiver from this particular store
    
    #3. (Instance) Find most popular category of gifts at the store

    #4. Most expensive gift given and to whom

    #5. Stores by themes (sort by Group attribute)



end
