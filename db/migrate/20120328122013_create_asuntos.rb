require 'dbf'

class Asunto < ActiveRecord::Base
end

class CreateAsuntos < ActiveRecord::Migration
  def change
    create_table :asuntos do |t|
      t.integer :numero
      t.string :letra
      t.integer :tipo
      t.integer :pasada
      t.integer :asuntoentr
      t.date :fechaasen
      t.integer :numreunion
      t.integer :numsesion
      t.integer :asunto
      t.integer :comision1
      t.integer :comision2
      t.integer :comision3
      t.integer :comision4
      t.integer :comision5
      t.integer :comsion6

      t.timestamps
    end

    table = DBF::Table.new('db/legacy/asunto.dbf')
    table.encoding = "cp1252"
    # TODO: podría ser otro el encoding correspondiente
    # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

    say_with_time "migrando expedientes" do
      Asunto.reset_column_information
      table.each do |record|
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        Asunto.create!(attributes)
      end
      Asunto.all.count
    end
  end
end
