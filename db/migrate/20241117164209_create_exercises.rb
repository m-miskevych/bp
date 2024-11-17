class CreateExercises < ActiveRecord::Migration[7.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.integer :set
      t.integer :repetition

      t.timestamps
    end
  end
end
