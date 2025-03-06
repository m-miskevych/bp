class AddStatusToUserPlans < ActiveRecord::Migration[7.2]
  def change
    add_column :user_plans, :status, :integer, default: 0, null: false
  end
end
