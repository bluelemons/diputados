require 'prawnbot'
#include MyReport
require 'open-uri'

class ExpedientesReport < Prawnbot::Report

  def initialize
    super
    @header_title = "CAMARA DE DIPUTADOS"
    @header_subtitle = "Provicina de Santa Fe"

    @logo = "#{Rails.root}/app/assets/images/santa_fe_escudo_logo.png"
    @water_print = "#{Rails.root}/app/assets/images/santa_fe_escudo_fondo.png"

  end

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

    show_title "#{expediente.tipo_format} N #{expediente.numero} (#{expediente.pasada})"

    myform([
      "<b>Autor</b> #{expediente.autor}",
      "<b>Tema</b> #{expediente.tema}",
      "<b>Estado</b> #{expediente.estado}"])

    myform(["Descripcion"])

    mybox(expediente.descrip)

    myform(["Firmantes",expediente.firmantes])

    mybox("Entrada: #{expediente.fechaentr}, Por: #{expediente.tipoentr} a las #{expediente.hora} en el periodo #{expediente.tipoperiod} N #{expediente.numperiodo}")

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

    if expediente.sesion
      mybox("Tratamiento #{expediente.sesion.tratamient} Resultado de la votacion: #{expediente.sesion.resuvotac} Fecha de sesion #{expediente.sesion.fechases}")
    else
      mybox "Sin tratamiento en session"
    end

    render
  end
end

