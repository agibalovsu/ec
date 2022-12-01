class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.integer :phone_number, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
