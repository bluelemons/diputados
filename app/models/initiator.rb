class Initiator < ActiveRecord::Base
  belongs_to :initiators_kind
  attr_accessible :name, :initiators_kind_id
  
  delegate :name, to: :initiators_kind, prefix: true
end
