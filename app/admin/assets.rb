ActiveAdmin.register Asset do
  belongs_to :expediente

  form :html => {:multipart => true} do |f|
    f.inputs "Details" do
      f.input :asset, :as => :file
    end

    f.buttons

  end

  controller do

    load_and_authorize_resource
    skip_load_resource :only => :index

    def destroy
      destroy! do |format|
        format.html {redirect_to admin_expediente_path(@expediente)}
      end
    end
  end
end
