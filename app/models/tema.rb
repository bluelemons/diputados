class Tema < ActiveRecord::Base
  alias_attribute :name ,:nombre
end
