class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.integer :tipo
      t.string :nombre, :limit => 12

      t.timestamps
    end
  end
end

