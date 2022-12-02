class CreateConnectors < ActiveRecord::Migration[7.0]
  def change
    create_table :connectors do |t|
      t.string :connector_type, null: false
      t.string :condition, default: 'free'
      t.integer :power, null: false
      t.references :charging_station, foreign_key: true

      t.timestamps
    end
  end
end
