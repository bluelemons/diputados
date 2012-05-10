# Encoding: utf-8
require 'legacy/migration'
module Legacy
  class EstadoMigration < Migration
    def override_attributes(attributes)
      attributes[:comision_id] = attributes.delete(:comision)
      attributes
    end
  end
end

