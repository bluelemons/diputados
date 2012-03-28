require 'dbf'

class Diputado < ActiveRecord::Base
end

class CreateDiputados < ActiveRecord::Migration
  def change
    create_table :diputados do |t|
      t.integer :codigo
      t.string :nombre
      t.string :sexo
      t.string :bloque
      t.string :bloquea1
      t.string :bloquea2
      t.string :bloquea3
      t.string :direccion
      t.string :telefono
      t.string :localidad
      t.string :cp
      t.date :inicio
      t.date :fin
      t.string :profesion
      t.string :foto
      t.integer :mc
      t.integer :peri1
      t.integer :peri2
      t.integer :peri3
      t.integer :peri4
      t.date :feci1
      t.date :fecs1
      t.date :fecs2

      t.timestamps
    end
    table = DBF::Table.new('db/legacy/diputado.dbf')
    table.encoding = "cp1252"
    # TODO: podría ser otro el encoding correspondiente
    # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

    say_with_time "migrando expedientes" do
      Diputado.reset_column_information
      table.each do |record|
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        Diputado.create!(attributes)
      end
      Diputado.all.count
    end
  end
end
