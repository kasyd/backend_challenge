# Purpose: Migration to create the states table in the database.
class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :name

      t.timestamps
    end
  end
end
