require 'dbf'

class Senado < ActiveRecord::Base
end

class CreateSenados < ActiveRecord::Migration
  def change
    create_table :senados do |t|
      t.integer :codigo
      t.string :nombre
      t.string :sexo
      t.string :bloque
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

      t.timestamps
    end
    table = DBF::Table.new('db/legacy/senado.dbf')
    table.encoding = "cp1252"
    # TODO: podría ser otro el encoding correspondiente
    # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

    say_with_time "migrando expedientes" do
      Senado.reset_column_information
      table.each do |record|
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        Senado.create!(attributes)
      end
      Senado.all.count
    end
  end
end
