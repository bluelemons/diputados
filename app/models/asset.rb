class Asset < ActiveRecord::Base
  belongs_to :expediente
#  attr_accessible :asset
  has_attached_file :asset

  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  def admin_permalink
    admin_expediente_asset_path(self.expediente,self)
  end
end
