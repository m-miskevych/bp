class RemoveNameAndDescriptionFromExercises < ActiveRecord::Migration[7.2]
  def change
    remove_column :exercises, :name, :string
    remove_column :exercises, :description, :text
  end
end
