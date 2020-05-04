class CreateHousebathrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :housebathrooms do |t|
      t.references :house, foreign_key: true
      t.references :bathroom, foreign_key: true

      t.timestamps
    end
  end
end
