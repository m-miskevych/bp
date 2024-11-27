class CreateExercisesPlans < ActiveRecord::Migration[7.2]
  def change
    create_table :exercises_plans do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
