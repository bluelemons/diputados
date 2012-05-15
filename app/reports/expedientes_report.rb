require 'prawnbot'
require 'open-uri'

class ExpedientesReport < Prawnbot::Report

  def index(datos, params)
    body

    show_title "Listado de expedientes"

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

#    move_down 30

    mytable rows, :column_widths => widths

    render
  end

  def show(expediente)
    body

    show_title "DETALLE DE EXPEDIENTE"
    show_title "PASE POR COMISIONES"
    show_title "TRATAMIENTO EN SESION"

    render
  end
end

