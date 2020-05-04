class CreateHousekitchens < ActiveRecord::Migration[6.0]
  def change
    create_table :housekitchens do |t|
      t.references :house, null: false, foreign_key: true
      t.references :kitchen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
