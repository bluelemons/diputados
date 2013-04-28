class InitiatorsKind < ActiveRecord::Base
  attr_accessible :name
  has_many :initiators
end
