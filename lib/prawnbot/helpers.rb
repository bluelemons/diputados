module Resource
  module Helpers
    def show_title(t)
      r=self.font_size
      font_size 10 do
        text "<b>#{t}</b>", :inline_format => true
      end
      move_down 10
      font_size = r
    end

    def mybox( texto )
      table([[texto]], :row_colors => ["F0F0F0"])
      move_down 10
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
      bounding_box [0, cursor],:width => 250, :height => (data.size * 12) do
        data.each do |d|
          text d, :inline_format => true
        end
      end
    end
  end
end
