class Tema < ActiveRecord::Base

  LEGACY_CONSTRAINTS = [:tema]

  alias_attribute :name ,:nombre

end
