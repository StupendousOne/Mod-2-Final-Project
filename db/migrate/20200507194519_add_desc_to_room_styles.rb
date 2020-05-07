class AddDescToRoomStyles < ActiveRecord::Migration[6.0]
  def change
    add_column :room_styles, :desc, :string
  end
end
