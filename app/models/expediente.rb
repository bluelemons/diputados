# encoding: utf-8

class Expediente < ActiveRecord::Base
  Tipos = { 1 => "Ley", 2 => "Comunicación", 3 => "Declaración",
    4 => "Resolución", 5 => "Decreto", 6 => "Mensaje" }
  TiposColection = Tipos.invert

  def tipo
    Tipos[read_attribute(:tipo)] || "No indicado"
  end

  belongs_to :estado, :foreign_key => :estado, :class_name => Status

  def estados
    Estado.limit(3)
  end

  def sesion
    Sesion.first
  end

  def tipo_format
    "#{tipo} #{ley if tipo == "Ley"}"
  end
end
