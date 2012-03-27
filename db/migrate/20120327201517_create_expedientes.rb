require 'dbf'

class Expediente < ActiveRecord::Base
end

class CreateExpedientes < ActiveRecord::Migration
  def up

    create_table :expedientes do |t|
      t.column "numero", :integer
      t.column "letra", :string, :limit => 3
      t.column "tipo", :integer
      t.column "pasada", :integer
      t.column "numsenado", :integer
      t.column "tema", :integer
      t.column "descrip", :text
      t.column "fechaentr", :date
      t.column "hora", :string, :limit => 5
      t.column "autor", :string, :limit => 30
      t.column "firmantes", :text
      t.column "tipoentr", :integer
      t.column "tipoperiod", :integer
      t.column "numperiodo", :integer
      t.column "expte", :string, :limit => 10
      t.column "estado", :integer
      t.column "ley", :integer
      t.column "marca", :integer
      t.column "etiq", :integer
    end

    table = DBF::Table.new('db/legacy/proyecto.dbf')
    table.encoding = "cp1252"
    # TODO: podría ser otro el encoding correspondiente
    # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

    say_with_time "migrando expedientes" do
      Expediente.reset_column_information
      table.each do |record|
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        Expediente.create!(attributes)
      end
      Expediente.all.count
    end
  end

  def down
    drop_table :expedientes
  end
end

