class Tema < ActiveRecord::Base

  LEGACY_CONSTRAINTS = [:tema]

  alias_attribute :name ,:nombre

  def to_s
    name
  end

end
