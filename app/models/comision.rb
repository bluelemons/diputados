class Comision < ActiveRecord::Base
  alias_attribute :name ,:nombre

  default_scope :order => :nombre

  def to_s
    nombre
  end

end

