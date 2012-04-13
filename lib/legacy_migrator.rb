require 'dbf'

module Legacy
  class Migration

    attr_reader :legacy_table, :model

    # Inicializa la migracrion
    #

    def initialize(options)
      @legacy_table = DBF::Table.new("db/legacy/#{options[:legacy]}")
      @model = Object.const_get(options[:model])
    end

    def run(options)
      count = options[:count] || 2
      count.times do |i|
        record = @legacy_table.find(i)
        if record
          attributes = record.attributes.select { |k,v| k =~ /^[a-z]*$/ }
          @model.create!(attributes, :without_protection => true)
        end
      end
    end
  end
end

