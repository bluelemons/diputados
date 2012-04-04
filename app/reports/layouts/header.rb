module Header
#  def header(title,options={})
   def header_prawn(title)
    footer = true # default value
#    footer = options.delete(:footer)

    repeat :all do
      font_size 10 do
        fill_color 'ea7b09'
        draw_text "#{title}", :at => [0,710]
        #stroke do
        #  line bounds.bottom_left, bounds.bottom_right
        #end
        #image("#{RAILS_ROOT}/public/images/Sol_Lineas_Aereas.jpg",:at => [430,730],:scale=>0.35)
        fill_color '000000'

      end

      if footer
        font_size 6 do
          draw_text "Impreso: #{Date.today}",:at => [0,0]
          draw_text "#{title}",:at => [100,0]
#          image("#{Rails.root}/app/assets/images/blue-lemons.png",:at => [bounds.right - 150, 8],:scale=>0.30)
        end
      end
    end
  end
end
