class CreateBedrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :bedrooms do |t|
      t.string :room_type
      t.integer :size

      t.timestamps
    end
  end
end
