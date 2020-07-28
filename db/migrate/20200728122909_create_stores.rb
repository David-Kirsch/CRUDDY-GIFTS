class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :category
      t.string :name
      t.string :brand
      t.float :price
      t.string :description
    end
  end
end
