class AddUserIdToPicture < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :user_id, :string
    add_index :pictures, :user_id
  end
end
