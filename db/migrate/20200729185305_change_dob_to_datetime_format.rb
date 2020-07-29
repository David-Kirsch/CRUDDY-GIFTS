class ChangeDobToDatetimeFormat < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :dob, :datetime
  end
end
