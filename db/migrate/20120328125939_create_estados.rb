require 'dbf'

class Estado < ActiveRecord::Base
end

class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.integer :numero
      t.integer :tipo
      t.string :letra
      t.integer :pasada
      t.date :fechaent
      t.integer :comision
      t.date :tratamses
      t.date :fechasal
      t.text :dictmay
      t.text :dcitmin1
      t.text :dictmin2
      t.date :fechamay
      t.date :fechamin1
      t.date :fechamin2
      t.integer :v

      t.timestamps
    end

    table = DBF::Table.new('db/legacy/estado.dbf')
    table.encoding = "cp1252"
    # TODO: podría ser otro el encoding correspondiente
    # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

    say_with_time "migrando expedientes" do
      Estado.reset_column_information
      table.each do |record|
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        Estado.create!(attributes)
      end
      Estado.all.count
    end
  end
end

