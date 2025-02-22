class AddAdminToUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :admin, foreign_key: { to_table: :users }, null: true
  end
end
