class Status < ActiveRecord::Base
  LEGACY_CONSTRAINTS = [:estado]

  self.table_name = "status"

  has_many :expedientes

  def name
    nombre
  end
  alias_method :to_s, :name

end

