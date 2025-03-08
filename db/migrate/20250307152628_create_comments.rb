class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user_plan, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
