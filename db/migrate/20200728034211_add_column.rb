class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :gifts, :giver_id, :integer
    add_column :gifts, :receiver_id, :integer
  end
end
