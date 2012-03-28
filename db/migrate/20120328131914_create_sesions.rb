require 'dbf'

class Sesion < ActiveRecord::Base
end

class CreateSesions < ActiveRecord::Migration
  def change
    create_table :sesions do |t|
      t.integer :numero
      t.integer :tipo
      t.string :letra
      t.integer :pasada
      t.integer :tipoperiod
      t.integer :numperiodo
      t.integer :ordendia
      t.date :fechaordia
      t.integer :numreunion
      t.integer :numsesion
      t.integer :asunto
      t.date :fechases
      t.integer :tratamient
      t.integer :resuvotac
      t.integer :comision1
      t.integer :comision2
      t.integer :comision3
      t.integer :comision4
      t.integer :comision5
      t.integer :comision6
      t.text :observ
      t.integer :wp

      t.timestamps
    end
    table = DBF::Table.new('db/legacy/sesion.dbf')
    table.encoding = "cp1252"
    # TODO: podría ser otro el encoding correspondiente
    # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

    say_with_time "migrando expedientes" do
      Sesion.reset_column_information
      table.each do |record|
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        Sesion.create!(attributes)
      end
      Sesion.all.count
    end
  end
end
