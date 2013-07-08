class Backend::AssetsController < Backend::AuthenticatedApplicationController

  authorize_resource
  actions :create, :destroy
  belongs_to :nota, :polymorphic => true, :optional => true

  def create
    create! { [:backend, parent] }
  end

  def destroy
    destroy! { [:backend, parent] }
  end

end
