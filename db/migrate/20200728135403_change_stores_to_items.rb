class ChangeStoresToItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :stores, :items
  end
end
