class Backend::AuthenticatedApplicationController < Backend::ApplicationController
  authorize_resource
  before_filter :authenticate_backend_admin_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_backend_admin_user)
  end

  def current_user
    current_backend_admin_user
  end

end
