class Backend::AuthenticatedApplicationController < Backend::ApplicationController
  before_filter :authenticate_backend_admin_user!
end
