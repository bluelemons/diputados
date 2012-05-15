require 'prawnbot'

Prawnbot::Report.setup do |config|

  # set the font size of the reports.
  config.fsize = 10

  #config.with_header = true default on true
  config.with_header = true

  #config.with_footer = true default on false
  config.with_footer = true

  #header_title and header_subtitle set the titles of the reports
  config.header_title = "CAMARA DE DIPUTADOS"
  config.header_subtitle = "Provicina de Santa Fe"

  # set the url of the images you are going to use for the reports.
  config.logo = "#{Rails.root}/app/assets/images/santa_fe_escudo_logo.png"
  config.water_print = "#{Rails.root}/app/assets/images/santa_fe_escudo_fondo.png"


  #title style
  config.title_font_size = 12
  config.title_font_color = "6b0303"

end


