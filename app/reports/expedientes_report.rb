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

    report_line([
      "#{expediente.clave}",
      "<b>Autor</b> #{expediente.autor}",
      "<b>Tema</b> #{expediente.tema}",
      "<b>Estado</b> #{expediente.estado}",
      " ",
      "<b>Descripcion</b>",
      "#{expediente.descrip}",
      " ",
      "<b>Firmantes</b> #{expediente.firmantes}",
      " ",
      "Entrada: #{expediente.fechaentr}, Por: #{expediente.tipoentr} a las #{expediente.hora} en el periodo #{expediente.tipoperiod} N #{expediente.numperiodo}"
      ])

    show_title "PASE POR COMISIONES"
    expediente.estados.each do |estado|

      dic = ""
      estado.dictamenes.each do |dictamen|
        dic += "<b>#{dictamen[:tipo]}</b> <b>fecha</b>: #{dictamen[:fecha]}<br>"
        dic += "#{dictamen[:dictamen]}<br>"
      end

      report_line([
        "#{estado.comision.name}",
        "<b>Entrada:</b>#{estado.fechaent}  <b>Salida:</b>#{estado.fechasal}",
        dic
      ])

    end

    show_title "TRATAMIENTO EN SESION"

    render
  end
end

