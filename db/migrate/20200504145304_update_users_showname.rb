class UpdateUsersShowname < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :show_name, :string
  end
end
