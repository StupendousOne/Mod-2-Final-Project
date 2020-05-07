class AddUserIdToEachModel < ActiveRecord::Migration[6.0]
  def change
    add_reference :houses, :user, foreign_key: {on_delete: :cascade}
    add_reference :bedrooms, :user, foreign_key: {on_delete: :cascade}
    add_reference :bathrooms, :user, foreign_key: {on_delete: :cascade}
    add_reference :garages, :user, foreign_key: {on_delete: :cascade}
    add_reference :other_rooms, :user, foreign_key: {on_delete: :cascade}
    add_reference :kitchens, :user, foreign_key: {on_delete: :cascade}
    add_reference :room_styles, :user, foreign_key: {on_delete: :cascade}
  end
end
