class AddUserIdToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :user_id, :string
    add_index :locations, :user_id
  end
end
