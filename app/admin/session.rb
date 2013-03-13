ActiveAdmin.register Session do

  form do |f|
    f.inputs "" do
      f.input :fecha, as: :string, input_html: { class: 'datepicker' }
      f.input :numero_de_periodo
    end
    f.buttons
  end

end
