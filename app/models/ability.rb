# Clase que indica los permisos de los distintos usuarios a partir de su rol.

class Ability
  include CanCan::Ability

  # Por defecto todos los {AdminUser usuarios} tienen permiso de lectura en
  # todos los recursos.
  def initialize(user)
    @@user = user || AdminUser.new # Guest user
    can :read, :all
    @@user.roles.each do |r|
      self.send(r.name.downcase)
    end
  end

  # Los administradores tienen todos los permisos.
  def admin
    can :manage, :all
  end

  def manger
    can :manage, [Session, Area, Tag]
  end

  # Administra {Asset documentos escaneados} y {Nota notas}.
  def mesa_de_entrada
    can :manage, [Asset, Nota, Pase]
  end
end
