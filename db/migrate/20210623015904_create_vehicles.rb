# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :identifier, index: { unique: true }, null: false
      # t.string :identifier, unique: true, null:false
      t.timestamps
    end
  end
end
