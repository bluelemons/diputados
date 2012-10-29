# encoding: UTF-8
require 'legacy'

Legacy.seed_legacy_databases

admin_role = Role.find_or_create_by_name('Admin', :observations => "Acceso completo al sistema.")
Role.find_or_create_by_name('Mesa_de_Entrada', :observations => "Subir y borrar documentos escaneados.")

AdminUser.find_or_create_by_email("admin@example.com", :password => "password", :roles => [admin_role])

