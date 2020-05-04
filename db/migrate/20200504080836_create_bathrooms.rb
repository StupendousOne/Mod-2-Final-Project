class CreateBathrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :bathrooms do |t|
      t.string :room_type
      t.integer :size
      t.boolean :half?

      t.timestamps
    end
  end
end
