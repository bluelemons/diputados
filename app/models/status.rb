class Status < ActiveRecord::Base
  LEGACY_CONSTRAINTS = [:estado]

  self.table_name = "status"

  has_many :expedientes

  default_scope where("nombre > ''")

  def name
    nombre
  end
  alias_method :to_s, :name

  def status_tag
    tipos = ["status"]
#    tipos << "ft" if nombre =~ /ft/
    tipos << "aprobado" if nombre =~ /probado/
    tipos << "mal" if nombre =~ /(echazado|etado)/

    "<span class='#{tipos.join(" ")}'>#{nombre}</span>".html_safe
  end

end

