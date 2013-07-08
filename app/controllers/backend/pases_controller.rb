class Backend::PasesController < Backend::AuthenticatedApplicationController
  belongs_to :nota

  def create
    create! { [:backend, @pase.expediente] }
  end

  def update
    update! { [:backend, @pase.expediente] }
  end

  def destroy
    destroy! { [:backend, @pase.expediente] }
  end

end
