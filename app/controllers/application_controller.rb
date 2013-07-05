class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :mailer_set_url_options

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end

  def current_user
    current_admin_user
  end

  def after_sign_in_path_for(resource)
    if request.path.split("/")[1] == "backend"
      backend_root_path
    else
      admin_notas_path
    end
  end
end
