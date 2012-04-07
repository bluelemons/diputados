# encoding: utf-8

class Expediente < ActiveRecord::Base
  Tipos = { 1 => "Ley", 2 => "Comunicación", 3 => "Declaración",
    4 => "Resolución", 5 => "Decreto", 6 => "Mensaje" }
  TiposColection = Tipos.invert

  def tipo
    Tipos[read_attribute(:tipo)] || "No indicado"
  end
end

