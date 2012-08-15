ActiveAdmin.register Asset do

  form :html => {:multipart => true} do |f|
    f.inputs "Details" do
      f.input :asset, :as => :file
    end

    f.buttons

  end

  controller do

    load_and_authorize_resource
    skip_load_resource :only => :index

    before_filter :only => :show do
#      flash[:notice] = flash[:notice].dup if flash[:notice]
      asset = Asset.find(params[:id])
      resource_config = active_admin_config.namespace.resource_for(asset.adjuntable.class)
      redirect_to send(resource_config.route_instance_path, asset.adjuntable)
    end

    def destroy
      destroy! do |format|
        format.html {
          resource_config = active_admin_config.namespace.resource_for(@asset.adjuntable.class)
          redirect_to send(resource_config.route_instance_path, @asset.adjuntable)
        }
      end
    end
  end
end
