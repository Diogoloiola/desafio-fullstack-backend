class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table(:users, :id => false) do |t|
      t.string :id, :options => 'PRIMARY KEY'
      t.string :gender
      t.string :title_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birth_date
      t.integer :age
      t.date :registered_date
      t.integer :age_registred
      t.string :phone
      t.string :cell
      t.string :id_name
      t.string :id_value
      t.string :nationality
      t.string :username
      t.string :password
      t.string :salt
      t.string :md5
      t.string :sha1
      t.string :sha256
      t.timestamps
    end
  end
end
