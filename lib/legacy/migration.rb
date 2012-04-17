# Encoding: utf-8
require 'dbf'
require 'seed-fu'
require 'legacy/tables'

module Legacy
  class Migration

    # @return [DBF::Table]

    attr_reader :legacy_table

    # Modelo de la aplicación al cual se migran los datos.
    # @return [constant]

    attr_reader :model

    # Tipo de salida de la aplicación.
    # @return [nil, :dots] nil : sin salida, :dots : para mostrar progreso.

    attr_accessor :output

    # Inicializa la migración
    #
    # @param [Hash] opts Datos de inicialización.
    # @option opts [String] :legacy_table Archivo dbf de donde obtener los datos
    # @option opts [Constant] :model Modelo donde guardar los datos.
    # @option opts [Bool] :verbose (false) be verbose.
    # @option opts [:dots, nil] :output (nil) (see #output)

    def initialize(opts)
      @legacy_table = DBF::Table.new("db/legacy/#{opts[:legacy]}")
      @model = opts[:model]
      # constraints for seed-fu seeding
      @constraints = @model.const_get(:LEGACY_CONSTRAINTS) rescue [:id]
      # references to fill if possible.
      @references = @model.reflect_on_all_associations(:belongs_to)
      SeedFu.quiet = true unless opts.delete(:verbose)
      @legacy_table.encoding = opts[:encoding] || Legacy::LEGACY_ENCODING
      @output = opts[:output] || nil
    end

    # Corre la migración
    #
    # @option opts [:all, Fixnum] :count (:all) cantidad de datos a migrar (:all
    #   para migrar todos los registros).

    def run(opts = {})
      count = opts[:count] || :all
      if count.kind_of? Integer
        count.times do |i|
          record = @legacy_table.find(i)
          migrate_record(record) if record
        end
      else
        @legacy_table.each do |record|
          migrate_record(record) if record
        end
      end
    end

    # Cierra el archivo dbf.
    #
    # @return [Bool]

    def close
      @legacy_table.close
    end

    private

    def migrate_record(record)
      attributes = downcase_and_symbolize_attributes record.attributes
      attributes.merge! build_references(attributes) unless @references.empty?
      @model.seed(*@constraints, attributes)
      print "·" if @output == :dots
    end

    def build_references(seed_attr)
      hash = {}
      @references.each do |r|
        hash[r.foreign_key] = find_associated_record_id(r.klass, seed_attr)
      end
      hash
    end

    def find_associated_record_id(model, seed_attributes)
      relation = model
      model.const_get(:LEGACY_CONSTRAINTS).each do |a|
        relation.where(a => seed_attributes[a.to_sym])
      end
      relation.first.try :id
    end

    def downcase_and_symbolize_attributes(attributes)
      hash = {}
      attributes.each { |k,v| hash[k.downcase.to_sym] = v }
      hash
    end

  end
end

