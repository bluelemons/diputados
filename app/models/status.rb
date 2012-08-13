class Status < ActiveRecord::Base
  LEGACY_CONSTRAINTS = [:estado]

  self.table_name = "status"

  has_many :expedientes

  default_scope where("nombre > ''")

  def name
    nombre
  end
  alias_method :to_s, :name

end

