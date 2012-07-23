# encoding: utf-8

class Expediente < ActiveRecord::Base

  LEGACY_CONSTRAINTS = [:numero, :letra, :pasada, :tipo]

  Tipos = { 1 => "Ley", 2 => "Comunicación", 3 => "Declaración",
    4 => "Resolución", 5 => "Decreto", 6 => "Mensaje" }
  TiposColection = Tipos.invert

  def tipo
    Tipos[read_attribute(:tipo)] || "No indicado"
  end

  belongs_to :estado, :class_name => Status
  Entrada = { 1 => "Mesa de entrada", 2 => "Secretaria"}
  def tipoentr
    Entrada[read_attribute(:tipoentr)] || "No indicado"
  end

  Periodo = { 1 => "Ordinario", 2 => "De prorroga", 3 => "Extraordinario"}
  def tipoperiod
    Periodo[read_attribute(:tipoperiod)] || "No indicado"
  end

  scope :day, where("fechaentr >= ?", 1.day.ago.strftime("%Y-%m-%d"))
  scope :week, where("fechaentr >= ?", 1.week.ago.strftime("%Y-%m-%d"))
  scope :month, where("fechaentr >= ?", 1.month.ago.strftime("%Y-%m-%d"))

  belongs_to :tema
  has_many :estados
  has_many :prefers

  # puede ser un has_one, pero no estoy seguro.
  has_many  :asuntos
  has_many  :finals
  has_one   :sesion

  # Al migrar asigno directamente el numero que deberia ser guardado como
  # estado_id y que de otra forma se confunde. Asi hago que funcionen los dos en
  # simultaneo.
  def tema=(tema)
    if tema.is_a? Fixnum
      write_attribute(:tema, tema)
    else
      super
    end
  end

  def estado=(estado)
    if estado.is_a? Fixnum
      write_attribute(:estado, estado)
    else
      super
    end
  end

  def tipo_format
    "#{tipo} #{ley if tipo == "Ley" and ley > 0}"
  end

  def entrada
    "#{fechaentr} #{hora} por: #{tipoentr}"
  end

  def periodo
    "#{tipoperiod} Numero: #{numperiodo}"
  end

  def clave
    "#{numero} #{letra} #{tipo_format} (#{pasada})"
  end

  def html_descrip
    pretty_descrip = descrip.mb_chars.capitalize
    "<p>#{pretty_descrip}</p>".html_safe
  end

  def archivos_digitales
    # http://www.ruby-doc.org/core-1.9.3/Dir.html#method-c-glob
    archivos = Array.new
    Dir.glob(Rails.root.join "public", "assets", "pdf", "**", "**",reglas_del_archivo) do |archivo|
      i = archivo.index("public").to_i + 6
      archivos.push archivo[i..archivo.length]
    end

    archivos
  end

  def reglas_del_archivo
    #todos los archivos
    #"*"
    #los archivos que empiezan con el numero del expediente
    "??#{numero}*"
  end

end

