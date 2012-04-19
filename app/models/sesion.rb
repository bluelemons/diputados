class Sesion < ActiveRecord::Base
  LEGACY_CONSTRAINTS = [:numero, :tipo, :letra, :pasada, :tipoperiod,
       :numperiodo, :ordendia, :fechaordia, :numreunion, :numsesion, :asunto,
       :fechases, :tratamient, :resuvotac, :comision1, :comision2, :comision3,
       :observ, :wp]

  # @return [Expediente]
  belongs_to :expediente
end

