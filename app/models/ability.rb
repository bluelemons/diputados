class Ability
  include CanCan::Ability

  @@user
  def initialize(user)
    @@user = user || AdminUser.new # Guest user
    can :read, :all
    @@user.roles.each do |r|
      self.send(r.name.downcase)
    end
  end

  def admin
    can :manage, :all
  end

  def manger
    can :manage, [Session, Area, Tag]
  end

  def mesa_de_entrada
    can :manage, [Asset, Nota, Pase]
  end
end
