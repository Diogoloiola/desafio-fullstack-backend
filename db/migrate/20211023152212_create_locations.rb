class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :postcode
      t.decimal :latitude, :precision => 15, :scale => 10, :default => 0.0
      t.decimal :longitude, :precision => 15, :scale => 10, :default => 0.0
      t.string :timezone_offset
      t.string :timezone_description
      t.timestamps
    end
  end
end
