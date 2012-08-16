class NotaTipo < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :letra, :presence => true, :uniqueness => true
end
