class Sesion < ActiveRecord::Base
  LEGACY_CONSTRAINTS = [:numero, :tipo, :letra, :pasada, :tipoperiod,
       :numperiodo, :ordendia, :fechaordia, :numreunion, :numsesion, :asunto,
       :fechases, :tratamient, :resuvotac, :comision1, :comision2, :comision3,
       :observ, :wp]

  # @return [Expediente]
  belongs_to :expediente

  Resultado = {
    1 => "Aprobado sin modificaciones",
    2 => "Aprobado con modificaciones",
    3 => "Vuelta a comision",
    4 => "Rechazado",
    5 => "Al archivo"
    }
  def resultado
    Resultado[read_attribute(:resuvotac)] || "No indicado"
  end

  Tratamiento = { 1 => "Orden del dia", 2 => "Sobre tablas", 3 => "Preferencial"}
  def tratamiento
    Tratamiento[read_attribute(:tratamient)] || "No indicado"
  end

  Periodo = { 1 => "Ordinario", 2 => "De prorroga", 3 => "Extraordinario"}
  def tipoperiod
    Periodo[read_attribute(:tipoperiod)] || "No indicado"
  end

  def periodo
    "#{tipoperiod} Numero: #{numperiodo}"
  end
end
