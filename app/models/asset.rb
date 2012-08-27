class Asset < ActiveRecord::Base
  belongs_to :adjuntable, :polymorphic => true
#  attr_accessible :asset
  has_attached_file :asset

end

