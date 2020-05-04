class CreateGarages < ActiveRecord::Migration[6.0]
  def change
    create_table :garages do |t|
      t.string :room_type
      t.integer :size

      t.timestamps
    end
  end
end
