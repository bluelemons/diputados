# encoding: UTF-8
puts 'Tipos de sessions'
sessions = ['Ordinario', 'Extraordinario', 'Prórroga']
if SessionType.count == 0
  sessions.each { |session| SessionType.create({ name: session })}
end

require 'legacy'

puts 'Inicia importación de datos'
Legacy.seed_legacy_databases
puts 'Finaliza importación de datos'

puts 'Inicia creación de roles'
admin = Role.where(name: "admin").first_or_create! do |role|
  role.observations = "Rol de Administración con todos los permisos"
end

Role.where(name: "mesa_de_entrada").first_or_create! do |role|
  role.observations = "Este usuario puede subir y bajar los archivos de expedientes."
end
puts 'Finaliza creación de roles'

puts 'Inicia creación de usuarios'
AdminUser.where(email: "oldani.pablo@gmail.com").first_or_create!(
  password: "password",
  password_confirmation: "password"
) do |user|
  user.roles << admin
end

AdminUser.where(email: "admin@example.com").first_or_create!(
  password: "password",
  password_confirmation: "password"
) do |user|
  user.roles << admin
end
puts 'Finaliza creación de usuarios'

