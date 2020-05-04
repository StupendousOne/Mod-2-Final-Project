class CreateOtherRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :other_rooms do |t|
      t.string :type
      t.integer :size

      t.timestamps
    end
  end
end
