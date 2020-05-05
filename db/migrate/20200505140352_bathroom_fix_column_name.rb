class BathroomFixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :bathrooms, :half?, :half
  end
end
