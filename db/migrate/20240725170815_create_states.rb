# Purpose: Migration to create the states table in the database.
class CreateStates < ActiveRecord::Migration[5.0]
  def up
    create_table :states do |t|
      t.string :name
      t.string :uf
    end

    execute "
    INSERT INTO states (id, uf, name) VALUES
    (1,'PR','Paraná'),
    (2,'SC','Santa Catarina'),
    (3,'RS','Rio Grande do Sul')"
  end

  def down
    drop_table :states
  end
end
