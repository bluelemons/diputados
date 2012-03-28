require 'dbf'

class Tema < ActiveRecord::Base
end

class CreateTemas < ActiveRecord::Migration
  def change
    create_table :temas do |t|
      t.integer :tema
      t.string :nombre

      t.timestamps
    end
    table = DBF::Table.new('db/legacy/temas.dbf')
    table.encoding = "cp1252"
    # TODO: podría ser otro el encoding correspondiente
    # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

    say_with_time "migrando expedientes" do
      Tema.reset_column_information
      table.each do |record|
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        Tema.create!(attributes)
      end
      Tema.all.count
    end
  end
end
