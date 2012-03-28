require 'dbf'

class Tipo < ActiveRecord::Base
end

class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.integer :tipo
      t.string :nombre

      t.timestamps
    end
    table = DBF::Table.new('db/legacy/tipo.dbf')
    table.encoding = "cp1252"
    # TODO: podría ser otro el encoding correspondiente
    # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

    say_with_time "migrando expedientes" do
      Tipo.reset_column_information
      table.each do |record|
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        Tipo.create!(attributes)
      end
      Tipo.all.count
    end
  end
end
