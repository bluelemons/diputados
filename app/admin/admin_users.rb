ActiveAdmin.register AdminUser do

  menu :if => proc{ can?(:manage, AdminUser) },:parent => "Usuarios"

  filter :email

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
  end

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  show do
    panel "Usuario" do
      attributes_table_for admin_user,
        :id, :email, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :created_at, :updated_at

    end

    panel "Roles" do
      table_for admin_user.roles do
        column :name
        column :observations
      end
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :roles_tokens,
      :input_html => {
        "data-pre" => f.object.roles.to_json(:methods => :name), :only => [:id, :name] }
    end
    f.buttons
  end

  after_create { |admin| admin.send_reset_password_instructions }

  def password_required?
    new_record? ? false : super
  end

end
