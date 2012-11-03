class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :role_ids, :roles_tokens, :area_ids

  has_and_belongs_to_many :roles, :uniq => true

  attr_reader :roles_tokens

  has_and_belongs_to_many :areas, :uniq => true

  def roles_tokens=(ids)
    self.role_ids = ids.split(",")
  end

end
