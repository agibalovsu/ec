class CreateChargingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :charging_sessions do |t|
      t.integer :count_of_power, null: false
      t.references :connector, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
