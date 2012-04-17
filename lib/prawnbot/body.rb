module Resource

  module Body

    def body

      header if @with_header
      footer if @with_footer

      @fsize = self.font_size

    end

    def header
      repeat :all do
        bounding_box [0, cursor],:width => 500, :height => 90 do
          fill_color "6b0303"
          image(@logo,:at => [bounds.right - 50, cursor - 12],:scale=>0.30)
          image(@water_print,:at => [50, cursor - 100])
          font_size 11 do
            stroke_horizontal_rule
            pad(20) {
              text "<b>#{@header_title}</b>",:inline_format => true

              text @header_subtitle,:inline_format => true
            }
            stroke_horizontal_rule
            move_down 10
          end
          fill_color "000000"
        end
      end
    end

    def footer
      repeat :all do
        font_size 6 do
          draw_text "Impreso: #{Date.today}",:at => [0,0]
          draw_text "#{page.document.page_number} / #{page.document.page_count}", :at => [bounds.right - 50,0]

  #       image("#{Rails.root}/app/assets/images/blue-lemons.png",:at => [bounds.right - 150, 8],:scale=>0.30)
        end
      end
    end

  end

end
