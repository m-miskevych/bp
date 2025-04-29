class CreateSessionSlots < ActiveRecord::Migration[7.2]
  def change
    create_table :session_slots do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :duration
      t.datetime :available_at
      t.references :physiotherapist, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
