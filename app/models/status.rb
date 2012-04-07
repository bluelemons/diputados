class Status < ActiveRecord::Base
  self.table_name = "status"
  self.primary_key = "estado"

  has_many :expedientes, :foreign_key => :estado

  def name
    nombre
  end
end

