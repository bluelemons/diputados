ActiveAdmin.register IniciadorTipo do
  menu :if => proc{ can?(:create, IniciadorTipo) }, :parent => "Notas"

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
  end

end
