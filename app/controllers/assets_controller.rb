class AssetsController < InheritedResources::Base

  actions :create, :destroy
  belongs_to :proyecto, :polymorphic => true, :optional => true
  belongs_to :nota, :polymorphic => true, :optional => true
  authorize_resource

  def create
    create! { [:admin, parent] }
  end

  def destroy
    destroy! { [:admin, parent] }
  end

end

