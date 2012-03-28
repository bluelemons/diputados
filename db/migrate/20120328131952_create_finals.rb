require 'dbf'

class Final < ActiveRecord::Base
end

class CreateFinals < ActiveRecord::Migration
  def change
    create_table :finals do |t|
      t.integer :numero
      t.string :letra
      t.integer :tipo
      t.integer :pasada
      t.integer :nota
      t.integer :nronota
      t.integer :fechanota
      t.integer :nroexpte
      t.date :respu
      t.date :archi
      t.integer :tomo
      t.integer :ley
      t.integer :decreto
      t.date :promu
      t.integer :veto
      t.integer :tipoveto
      t.integer :expveto
      t.date :caducado

      t.timestamps
    end
    table = DBF::Table.new('db/legacy/final.dbf')
    table.encoding = "cp1252"
    # TODO: podría ser otro el encoding correspondiente
    # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

    say_with_time "migrando expedientes" do
      Final.reset_column_information
      table.each do |record|
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        Final.create!(attributes)
      end
      Final.all.count
    end
  end
end
