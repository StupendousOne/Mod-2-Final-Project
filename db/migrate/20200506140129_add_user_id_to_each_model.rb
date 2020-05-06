class AddUserIdToEachModel < ActiveRecord::Migration[6.0]
  def change
    add_reference :houses, :user, foreign_key: true
    add_reference :bedrooms, :user, foreign_key: true
    add_reference :bathrooms, :user, foreign_key: true
    add_reference :garages, :user, foreign_key: true
    add_reference :other_rooms, :user, foreign_key: true
    add_reference :kitchens, :user, foreign_key: true
    add_reference :room_styles, :user, foreign_key: true

    add_foreign_key :houses, :users
    add_foreign_key :bedrooms, :users
    add_foreign_key :bathrooms, :users
    add_foreign_key :garages, :users
    add_foreign_key :other_rooms, :users
    add_foreign_key :kitchens, :users
    add_foreign_key :room_styles, :users
  end
end
