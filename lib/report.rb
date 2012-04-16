module MyReport
  class Report < Prawn::Document
    attr_accessor :header_title, :with_header, :with_footer, :fsize, :logo, :water_print,
      :title

    def initialize

      @fsize = 7
      @with_header = true
      @with_footer = true
      @header_title = "CAMARA DE DIPUTADOS"
      @header_subtitle = "Provicina de Santa Fe"

      @logo = "#{Rails.root}/app/assets/images/santa_fe_escudo_logo.png"
      @water_print = "#{Rails.root}/app/assets/images/santa_fe_escudo_fondo.png"

      self.font_size = @fsize
      super
    end

    def header
      repeat :all do
        bounding_box [0, cursor],:width => 500, :height => 90 do
          fill_color "6b0303"
          image(@logo,:at => [bounds.right - 50, cursor - 12],:scale=>0.30)
          image(@water_print,:at => [50, cursor - 100])
          self.font_size = 10
          stroke_horizontal_rule
          pad(20) {
            text "<b>#{@header_title}</b>",:inline_format => true

            text @header_subtitle,:inline_format => true
          }
          stroke_horizontal_rule
          move_down 10
          fill_color "000000"
        end

        if @with_footer
          font_size 6 do
            draw_text "Impreso: #{Date.today}",:at => [0,0]
            draw_text "#{@title}",:at => [100,0]
  #          image("#{Rails.root}/app/assets/images/blue-lemons.png",:at => [bounds.right - 150, 8],:scale=>0.30)
          end
        end

        @fsize = self.font_size
      end
    end

    def show_title(t)
      @title = t
      text "<b>#{@title}</b>",:inline_format => true
      move_down 10
    end

    def mymemo (texto)
      table([[texto]], :row_colors => ["F0F0F0"])
    end

    def mytable( rows,options={} )

      widths = options.delete(:column_widths) || {}

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

    def myform(data)
      bounding_box [0, cursor],:width => 250, :height => (data.size * 20) do
        data.each do |d|
          text d,:inline_format => true
        end
      end
    end

  end
end
