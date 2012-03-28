require 'dbf'

class Prefer < ActiveRecord::Base
end

class CreatePrefers < ActiveRecord::Migration
  def change
    create_table :prefers do |t|
      t.integer :numero
      t.string :letra
      t.integer :tipo
      t.integer :pasada
      t.integer :preferen
      t.date :fechapref
      t.date :fechasol
      t.integer :tratado

      t.timestamps
    end
    table = DBF::Table.new('db/legacy/prefer.dbf')
    table.encoding = "cp1252"
    # TODO: podría ser otro el encoding correspondiente
    # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

    say_with_time "migrando expedientes" do
      Prefer.reset_column_information
      table.each do |record|
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        Prefer.create!(attributes)
      end
      Prefer.all.count
    end
  end
end
