class User < ActiveRecord::Base
    has_many :gifts, :class_name => 'Gift', :foreign_key => 'giver_id'
    has_many :items, through: :gifts

end