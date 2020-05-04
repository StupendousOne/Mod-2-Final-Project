class CreateHousebathrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :housebathrooms do |t|
      t.house :references
      t.bathroom :references

      t.timestamps
    end
  end
end
