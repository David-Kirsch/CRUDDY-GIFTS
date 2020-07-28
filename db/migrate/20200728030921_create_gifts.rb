class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :occasion
      t.integer :user_id
      t.integer :item_id
    end
  end
end
