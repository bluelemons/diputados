ActiveAdmin.register Expediente do

  filter :numero
  filter :tipo
  filter :letra
  filter :fechaentr
  filter :autor
  filter :firmantes
  filter :descripcion

  index do
    column :numero
    column :tipo
    column :letra
    column :pasada
    column :fechaentr
  end

end
