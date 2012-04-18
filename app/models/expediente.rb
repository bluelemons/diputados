# encoding: utf-8

class Expediente < ActiveRecord::Base

  LEGACY_CONSTRAINTS = [:numero, :letra, :pasada, :tipo]

  Tipos = { 1 => "Ley", 2 => "Comunicación", 3 => "Declaración",
    4 => "Resolución", 5 => "Decreto", 6 => "Mensaje" }
  TiposColection = Tipos.invert

  def tipo
    Tipos[read_attribute(:tipo)] || "No indicado"
  end

  belongs_to :estado, :foreign_key => :estado, :class_name => Status

  has_many :estados

  # puede ser un has_one, pero no estoy seguro.
  has_many  :asuntos

  # Al migrar asigno directamente el numero que deberia ser guardado como
  # estado_id y que de otra forma se confunde. Asi hago que funcionen los dos en
  # simultaneo.

  def estado=(estado)
    if estado.is_a? Fixnum
      write_attribute(:estado, estado)
    else
      super
    end
  end

  def tipo_format
    "#{tipo} #{ley if tipo == "Ley"}"
  end

  def self.find_by_legacy_id(data)
    self.where({ :numero => data[:numero], :letra => data[:letra],
      :pasada => data[:pasada], :tipo => data[:tipo]}).first
  end
end

