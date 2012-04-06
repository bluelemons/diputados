# encoding: UTF-8
require 'yaml'
require 'benchmark'
require 'dbf'

legacy_tables = YAML.load(File.open(File.join("db","legacy.yml")))

def seed_from_foxpro(tabla)
  modelo = Object.const_get(tabla['modelo'])

  legacy_table = DBF::Table.new("db/legacy/#{tabla['legacy']}")

  legacy_table.encoding = "CP850"
  # TODO: podría ser otro el encoding correspondiente: IBM437 o CP1252
  # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

  if legacy_table.record_count == modelo.count
    raise "Tabla ya migrada y sin registros nuevos #{legacy_table.record_count} #{modelo.count}"
  else
    modelo.delete_all
  end

  legacy_table.each do |record|
    begin
      if record
        attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
        modelo.create!(attributes)
        print('·')
      else
        print('V')
      end
    rescue
      print ('E')
    end
  end
  legacy_table.close

  modelo.all.count
end

legacy_tables.each do |tabla|
  begin
    puts "Migrando: #{tabla['legacy']}\n"
    time = Benchmark.measure { seed_from_foxpro(tabla) }
    puts "\n---\n#{tabla['legacy']} migrado correctamente en #{time.real} segundos\n"
  rescue
    puts $!
  end
end

AdminUser.find_or_create_by_email("admin@example.com", :password => "password")

