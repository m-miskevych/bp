class RemoveNameAndDescriptionFromPlans < ActiveRecord::Migration[7.2]
  def change
    remove_column :plans, :name, :string
    remove_column :plans, :description, :text
  end
end
