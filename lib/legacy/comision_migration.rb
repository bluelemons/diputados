# Encoding: utf-8
require 'legacy/migration'

module Legacy
  class ComisionMigration < Migration
    def override_attributes(attributes)
      attributes[:id] = attributes.delete(:codigo)
      attributes
    end
  end
end

