require "layouts/header.rb"
require "layouts/commons.rb"
include Header
include Commons

class ExpedientesReport < Prawn::Document

  def index(params)
    render
  end

  def show()
    header_prawn("Camara de diputados")

#    form({:ID => pase.id,
#          :EXPEDIENTE => pase.catastro.id,
#          :RESPONSABLE => pase.catastro.responsable,
#          :PARTIDA => pase.catastro.partida,
#          :FECHA => pase.entrada,
#          :OFICINA => pase.oficina.name,
#          :OBSERVADO => pase.observaciones
#        },
#          [20, bounds.top - 30])

    render
  end
end
