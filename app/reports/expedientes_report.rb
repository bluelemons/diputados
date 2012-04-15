require "layouts/header.rb"
require "layouts/commons.rb"
require "layouts/search.rb"
include Header
include Commons
include Search
require 'open-uri'


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

  def show(expediente)
#    header_prawn("Camara de diputados")
#Provincia de Santa Fe
#Detalle de expediente
    bounding_box [0, cursor],:width => 500, :height => 90 do
      fill_color "6b0303"
      image("#{Rails.root}/app/assets/images/santa_fe_escudo_logo.png",:at => [bounds.right - 50, cursor - 12],:scale=>0.30)
      image("#{Rails.root}/app/assets/images/santa_fe_escudo_fondo.png",:at => [50, cursor - 100])
      self.font_size = 10
      stroke_horizontal_rule
      pad(20) {
        text "<b>CAMARA DE DIPUTADOS</b>",:inline_format => true

        text "Provicina de Santa Fe"
      }
      stroke_horizontal_rule
      move_down 10
      fill_color "000000"

      self.font_size = 7
      text "<b>DETALLE DE EXPEDIENTE</b>",:inline_format => true
      move_down 10
    end


    bounding_box [0, cursor],:width => 250, :height => 40 do
      text "<b>Expdiente</b> De #{expediente.tipo_format} N #{expediente.numero} (#{expediente.pasada})",:inline_format => true
      text "<b>Autor</b> #{expediente.autor}",:inline_format => true
      text "<b>Tema</b> #{expediente.tema}",:inline_format => true
      text "<b>Estado</b> #{expediente.estado}",:inline_format => true
    end

    bounding_box [0, cursor], :width => 500, :height => 50 do
      text "Descripcion"
      move_down 5
      table([[expediente.descrip]], :row_colors => ["F0F0F0"])

    end

    bounding_box [0, cursor], :width => 500, :height => 30 do
      text "Firmantes"
      move_down 5
      text expediente.firmantes
#      transparent(0.1) { stroke_bounds }

    end

    bounding_box [0, cursor], :width => 500, :height => 40 do
      table([["Entrada: #{expediente.fechaentr}, Por: #{expediente.tipoentr} a las #{expediente.hora} en el periodo #{expediente.tipoperiod} N #{expediente.numperiodo}"]], :row_colors => ["F0F0F0"])
    end

    bounding_box [0, cursor], :width => 500, :height => 15 do
      text "<b>COMISIONES ASIGNADAS</b> (desde As. Entrados)",:inline_format => true
    end

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

    rows = header_row + valores_tabla
    widths = { }

    table rows, :header => true,
                :row_colors => %w[e2f0fb ffffff],
                :column_widths => widths do
      cells.style :borders => [:top], :overflow => :expand

#        # encabezado
      row(0).style :background_color => '87b6d9', :text_color => '000000', :align => :center
      # fila de totales:
      row(-1).style :font_style => :bold
    end

    move_down 10

    bounding_box [0, cursor], :width => 500, :height => 35 do
      text "<b>TRATAMIENTO EN SESION</b>",:inline_format => true
      texto = "Tratamiento #{expediente.sesion.tratamient} Resultado de la votacion: #{expediente.sesion.resuvotac} Fecha de sesion #{expediente.sesion.fechases}"
      table([[texto]], :row_colors => ["F0F0F0"])

    end

    render
  end
end
