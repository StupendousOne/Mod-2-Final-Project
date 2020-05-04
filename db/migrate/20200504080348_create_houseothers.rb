class CreateHouseothers < ActiveRecord::Migration[6.0]
  def change
    create_table :houseothers do |t|
      t.references :house, null: false, foreign_key: true
      t.references :other_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
