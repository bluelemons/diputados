class Role < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

#  has_paper_trail

  def admin_permalink
    admin_role_path(self)
  end
  
  has_and_belongs_to_many :admin_users
end
