class Status < ActiveRecord::Base
  LEGACY_CONSTRAINTS = [:estado]

  self.table_name = "status"
  self.primary_key = "estado"

  has_many :expedientes, :foreign_key => :estado

  def name
    nombre
  end
  alias_method :to_s, :name

end

