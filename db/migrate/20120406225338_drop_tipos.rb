class DropTipos < ActiveRecord::Migration
  def up
    drop_table :tipos
  end

  def down
    create_table :tipos do |t|
      t.integer :tipo
      t.string :nombre, :limit => 12

      t.timestamps
    end
  end
end

