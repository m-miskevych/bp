class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.references :session_slot, null: false, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.integer :status, default: 0
      t.text :notes

      t.timestamps
    end
  end
end
