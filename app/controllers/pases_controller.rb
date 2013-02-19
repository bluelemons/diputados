class PasesController < InheritedResources::Base

  actions :create, :update, :destroy
  belongs_to :nota
  authorize_resource

  def create
    create! { [:admin, parent] }
  end

  def destroy
    destroy! { [:admin, parent] }
  end

end

