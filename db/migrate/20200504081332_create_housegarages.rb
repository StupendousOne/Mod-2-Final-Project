class CreateHousegarages < ActiveRecord::Migration[6.0]
  def change
    create_table :housegarages do |t|
      t.references :house, foreign_key: true
      t.references :garage, foreign_key: true

      t.timestamps
    end
  end
end
