# frozen_string_literal: true

class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.string :title, null: false
      t.integer :latitude, null: false
      t.integer :longitude, null: false

      t.timestamps
    end
  end
end
