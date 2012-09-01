class Ability
  include CanCan::Ability

  @@user
  def initialize(user)
    @@user = user || User.new # Guest user
    can :read, AdminUser, :id => @@user.id
    @@user.roles.each do |r|
      self.send(r.name.downcase)
    end
  end

  def admin
    can :manage, :all
  end

  def mesa_de_entrada
    can :manage, [Asset, Nota, Pase, Area]
  end
end
