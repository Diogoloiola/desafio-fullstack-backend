class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :postcode
      t.integer :latitude
      t.integer :longitude
      t.string :timezone_offset
      t.string :timezone_description
      t.timestamps
    end
  end
end
