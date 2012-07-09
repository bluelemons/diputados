ActiveAdmin.register Role do

  menu :if => proc{ can?(:manage, Role) }, :parent => "Usuarios"

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
  end

end
