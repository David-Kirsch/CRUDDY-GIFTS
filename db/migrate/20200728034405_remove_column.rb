class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :gifts, :user_id
  end
end
