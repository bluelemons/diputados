class CreateDiputados < ActiveRecord::Migration
  def change
    create_table :diputados do |t|
      t.integer :codigo
      t.string :nombre, :limit => 30
      t.string :sexo, :limit => 1
      t.string :bloque, :limit => 3
      t.string :bloquea1, :limit => 3
      t.string :bloquea2, :limit => 3
      t.string :bloquea3, :limit => 3
      t.string :direccion, :limit => 25
      t.string :telefono, :limit => 8
      t.string :localidad, :limit => 25
      t.string :cp, :limit => 5
      t.date :inicio
      t.date :fin
      t.string :profesion, :limit => 15
      t.string :foto, :limit => 10
      t.integer :mc
      t.integer :peri1
      t.integer :peri2
      t.integer :peri3
      t.integer :peri4
      t.date :feci1
      t.date :fecs1
      t.date :feci2
      t.date :fecs2

      t.timestamps
    end
  end
end

