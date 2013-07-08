class Backend::AdminUsersController < Backend::AuthenticatedApplicationController

  def attributes
    [:id, :email, :sign_in_count , :current_sign_in_at , :last_sign_in_at,
      :current_sign_in_ip, :last_sign_in_ip]
  end

end
