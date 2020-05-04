class CreateHouseothers < ActiveRecord::Migration[6.0]
  def change
    create_table :houseothers do |t|
      t.house :references
      t.other_room :references

      t.timestamps
    end
  end
end
