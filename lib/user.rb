class User < ActiveRecord::Base
    has_many :received, :class_name => 'Gift', :foreign_key => 'receiver_id'
    has_many :given, :class_name => 'Gift', :foreign_key => 'giver_id'
    has_many :items, through: :gifts

end