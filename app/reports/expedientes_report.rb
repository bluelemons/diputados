require "layouts/header.rb"
require "layouts/commons.rb"
require "layouts/search.rb"
include Header
include Commons
include Search

class ExpedientesReport < Prawn::Document

  def index(datos, params)

    self.font_size = 7
    header_prawn("Camara de diputados")

    informacion_de_busqueda(params)

    header_row = [ %w[  ID
                        Numero
                        Tipo
                        Pasada
                        Letra
                        Entrada
                        Autor
                        Firmantes
                        ] ]

    valores_tabla = datos.all.map do |r|
      data_row = %W[  #{r.id}
                      #{r.numero}
                      #{r.tipo_format}
                      #{r.pasada}
                      #{r.letra}
                      #{r.fechaentr}
                      #{r.autor}
                      #{r.firmantes} ]
    end

    rows = header_row + valores_tabla
    widths = { 7 => 160 }

    bounding_box [20, bounds.top - 30], :width => 500, :height => bounds.top-30*2 do

      move_down 30

      table rows, :header => true,
                  :row_colors => %w[e2f0fb ffffff],
                  :column_widths => widths do
        cells.style :borders => [:top], :overflow => :expand

        # encabezado
        row(0).style :background_color => '87b6d9', :text_color => '000000', :align => :center
        # fila de totales:
        row(-1).style :font_style => :bold
      end
    end

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
