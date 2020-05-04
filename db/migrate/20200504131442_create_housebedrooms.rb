class CreateHousebedrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :housebedrooms do |t|
      t.references :house, null: false, foreign_key: true
      t.references :bedroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
