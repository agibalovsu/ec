class CreateChargingStations < ActiveRecord::Migration[7.0]
  def change
    create_table :charging_stations do |t|
      t.integer :serial_number, null: false
      t.references :point, foreign_key: true

      t.timestamps
    end
  end
end
