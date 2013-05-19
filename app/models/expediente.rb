# encoding: utf-8

class Expediente < ActiveRecord::Base

  # TODO Add Tags
  # TODO Add recursive relation
  # TODO Move everything that belong to proyect there.

  LEGACY_CONSTRAINTS = [:numero, :letra, :pasada, :tipo]

  has_and_belongs_to_many :tags, :uniq => true

  attr_reader :tags_tokens
  
  def tags_tokens=(ids)
    self.tag_ids = ids.split(",")
  end

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
  has_many :estados, dependent: :destroy
  has_many :prefers, dependent: :destroy

  # puede ser un has_one, pero no estoy seguro.
  has_one   :asunto
  has_many  :finals, dependent: :destroy
  has_many  :sesions, order: :id, dependent: :destroy
  has_one   :sesion

  has_one   :estado_actual, :class_name => :Estado, :conditions => { :fechasal => nil }
  has_one   :comision, :through => :estado_actual

  has_many :assets, :as => :adjuntable, dependent: :destroy
  has_many :pases, dependent: :destroy

#  has_one :primer_pase, :class_name => :Pase, :order => "id asc", :conditions => "1=1"
#  has_one :ultimo_pase, :class_name => :Pase, :order => "id desc", :conditions => "1=1"

  # Busca el final de tramite correspondiente y carga la descripcion o retorna
  # nil si no hay fin de tramite.
  def final
    descripciones = finals.collect(&:descripcion).delete_if { |d| d.empty? }
    descripciones.last
  end

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
    "#{tipo} #{ley if tipo == "Ley" and ley and ley > 0}"
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
    pretty_descrip = (descrip  || "").mb_chars#.capitalize
    "<p>#{pretty_descrip}</p>".html_safe
  end

  def archivos_digitales
    base_path = Rails.root.join "public"
    contained_files = []
    Dir[File.join(base_path, "system", "pdf", "**", reglas_del_archivo)].each do |full_path|
      path = Pathname.new(full_path).relative_path_from(base_path)
      contained_files << path
    end
    contained_files
  end

  def reglas_del_archivo
    #todos los archivos
    #"*"
    #los archivos que empiezan con el numero del expediente
    "??#{numero}*"
  end

  # las comisiones asignadas en el asunto entrado.
  def comisiones_asignadas
    asunto.comisiones if asunto
  end

  def tags_list
    tags.pluck :name
  end

end
