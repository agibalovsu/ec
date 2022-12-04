class CreateChargingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :charging_sessions do |t|
      t.references :connector, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
