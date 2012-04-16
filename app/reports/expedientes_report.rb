require "report.rb"
include MyReport
require 'open-uri'

class ExpedientesReport < MyReport::Report

  def index(datos, params)

    header

    show_title "Listado de expedientes"

    #informacion_de_busqueda(params)

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

    move_down 30

    mytable rows, :column_widths => widths

    render
  end

  def show(expediente)
    header

    show_title "DETALLE DE EXPEDIENTE"

    myform([
      "<b>Expediente</b> De #{expediente.tipo_format} N #{expediente.numero} (#{expediente.pasada})",
      "<b>Autor</b> #{expediente.autor}",
      "<b>Tema</b> #{expediente.tema}",
      "<b>Estado</b> #{expediente.estado}"])

    myform(["Descripcion"])

    mymemo(expediente.descrip)

    myform(["Firmantes",expediente.firmantes])

    mymemo("Entrada: #{expediente.fechaentr}, Por: #{expediente.tipoentr} a las #{expediente.hora} en el periodo #{expediente.tipoperiod} N #{expediente.numperiodo}")

    myform(["<b>COMISIONES ASIGNADAS</b> (desde As. Entrados)"])

    header_row = [ %w[  Comision
                      Entrada
                      Tratamses
                      Salida
                      Dictmay
                      Dictmin1
                      Dictmin2
                      Fechamay
                      Fechamin1
                      Fechamin2
                      V
                      ] ]
    valores_tabla = expediente.estados.all.map do |r|
      data_row = %W[  #{r.comision}
                      #{r.fechaent}
                      #{r.tratamses}
                      #{r.fechasal}
                      #{r.dictmay}
                      #{r.dictmin1}
                      #{r.dictmin2}
                      #{r.fechamay}
                      #{r.fechamin1}
                      #{r.fechamin2}
                      #{r.v} ]
      end

    mytable (header_row + valores_tabla)

    move_down 10

    myform ["<b>TRATAMIENTO EN SESION</b>"]

    mymemo("Tratamiento #{expediente.sesion.tratamient} Resultado de la votacion: #{expediente.sesion.resuvotac} Fecha de sesion #{expediente.sesion.fechases}")

    render
  end
end
