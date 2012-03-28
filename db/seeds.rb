require 'yaml'
require 'benchmark'
require 'dbf'

config_file = File.join("db","legacy.yml")
legacy_configs = YAML.load(File.open(config_file))

def seed_from_foxpro(tabla, detalles)
  modelo = Object.const_get detalles["modelo"]
  modelo.delete_all
  legacy_table = DBF::Table.new("db/legacy/#{detalles['legacy']}")

  legacy_table.encoding = "cp1252"
  # TODO: podría ser otro el encoding correspondiente
  # la lista: https://github.com/infused/dbf/blob/master/lib/dbf/encodings.yml

  legacy_table.each do |record|
    if record && attributes = record.attributes
      attributes = attributes.select { |k,v| k =~ /^[a-z]*$/ }
      modelo.create!(attributes)
    end
  end
  legacy_table.close

  modelo.all.count
end

legacy_configs.each do |tabla, detalles|
  puts "migrando #{tabla}"
  time = Benchmark.measure { seed_from_foxpro(tabla, detalles) }
  puts "#{tabla} migrado correctamente en #{time.real} segundos"
end

