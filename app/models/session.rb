class Session < ActiveRecord::Base
  belongs_to :area
  belongs_to :pase
end
