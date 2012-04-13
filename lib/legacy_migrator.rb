require 'dbf'
require 'seed-fu'

module Legacy
  class Migration

    attr_reader :legacy_table, :model

    # Inicializa la migracrion
    #

    def initialize(options)
      @legacy_table = DBF::Table.new("db/legacy/#{options[:legacy]}")
      @model = Object.const_get(options[:model])
      SeedFu.quiet = true unless options.delete(:verbose)
    end

    def run(options)
      count = options[:count] || 2
      count.times do |i|
        record = @legacy_table.find(i)
        if record
          attributes = clean_duplicated_attributes record.attributes
          @model.seed(attributes)
        end
      end
    end

    private

    def clean_duplicated_attributes(attributes)
      attributes.select { |k,v| k =~ /^[a-z]*$/ }
    end

  end
end

