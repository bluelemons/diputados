class Resolution < ActiveRecord::Base
  attr_accessible :body, :pase_id
  
  belongs_to :pase
end
