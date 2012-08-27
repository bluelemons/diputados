class AssetsController < InheritedResources::Base

  authorize_resource

  actions :create, :destroy

  def create
    create! { [:admin, @asset.adjuntable] }
  end

  def destroy
    destroy! { [:admin, @asset.adjuntable] }
  end

end

