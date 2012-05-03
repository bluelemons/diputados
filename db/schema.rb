# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120503020355) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "asuntos", :force => true do |t|
    t.integer  "numero"
    t.string   "letra",         :limit => 3
    t.integer  "tipo"
    t.integer  "pasada"
    t.integer  "asuntoentr"
    t.date     "fechaasen"
    t.integer  "numreunion"
    t.integer  "numsesion"
    t.integer  "asunto"
    t.integer  "comision1"
    t.integer  "comision2"
    t.integer  "comision3"
    t.integer  "comision4"
    t.integer  "comision5"
    t.integer  "comision6"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "expediente_id"
  end

  add_index "asuntos", ["expediente_id"], :name => "index_asuntos_on_expediente_id"
  add_index "asuntos", ["numero"], :name => "index_asuntos_on_numero"

  create_table "comisions", :force => true do |t|
    t.string   "nombre"
    t.integer  "pte"
    t.integer  "vice"
    t.integer  "int1"
    t.integer  "int2"
    t.integer  "int3"
    t.integer  "int4"
    t.integer  "int5"
    t.integer  "int6"
    t.integer  "int7"
    t.integer  "int8"
    t.integer  "int9"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "diputados", :force => true do |t|
    t.integer  "codigo"
    t.string   "nombre",     :limit => 30
    t.string   "sexo",       :limit => 1
    t.string   "bloque",     :limit => 3
    t.string   "bloquea1",   :limit => 3
    t.string   "bloquea2",   :limit => 3
    t.string   "bloquea3",   :limit => 3
    t.string   "direccion",  :limit => 25
    t.string   "telefono",   :limit => 8
    t.string   "localidad",  :limit => 25
    t.string   "cp",         :limit => 5
    t.date     "inicio"
    t.date     "fin"
    t.string   "profesion",  :limit => 15
    t.string   "foto",       :limit => 10
    t.integer  "mc"
    t.integer  "peri1"
    t.integer  "peri2"
    t.integer  "peri3"
    t.integer  "peri4"
    t.date     "feci1"
    t.date     "fecs1"
    t.date     "feci2"
    t.date     "fecs2"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "estados", :force => true do |t|
    t.integer  "numero"
    t.string   "letra",         :limit => 3
    t.integer  "tipo"
    t.integer  "pasada"
    t.date     "fechaent"
    t.integer  "comision_id"
    t.date     "tratamses"
    t.date     "fechasal"
    t.text     "dictmay"
    t.text     "dictmin1"
    t.text     "dictmin2"
    t.date     "fechamay"
    t.date     "fechamin1"
    t.date     "fechamin2"
    t.integer  "v"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "expediente_id"
  end

  add_index "estados", ["comision_id"], :name => "index_estados_on_comision_id"
  add_index "estados", ["expediente_id"], :name => "index_estados_on_expediente_id"
  add_index "estados", ["numero"], :name => "index_estados_on_numero"

  create_table "expedientes", :force => true do |t|
    t.integer  "numero"
    t.string   "letra",      :limit => 3
    t.integer  "tipo"
    t.integer  "pasada"
    t.integer  "numsenado"
    t.integer  "tema"
    t.text     "descrip"
    t.date     "fechaentr"
    t.string   "hora",       :limit => 5
    t.string   "autor",      :limit => 30
    t.text     "firmantes"
    t.integer  "tipoentr"
    t.integer  "tipoperiod"
    t.integer  "numperiodo"
    t.string   "expte",      :limit => 10
    t.integer  "estado"
    t.integer  "ley"
    t.integer  "marca"
    t.integer  "etiq"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "estado_id"
  end

  add_index "expedientes", ["estado_id"], :name => "index_expedientes_on_estado_id"
  add_index "expedientes", ["numero", "pasada", "letra", "tipo"], :name => "index_expedientes_on_legacy_id"

  create_table "finals", :force => true do |t|
    t.integer  "numero"
    t.string   "letra",         :limit => 3
    t.integer  "tipo"
    t.integer  "pasada"
    t.integer  "nota"
    t.integer  "nronota"
    t.date     "fechanota"
    t.integer  "nroexpte"
    t.date     "respu"
    t.date     "archi"
    t.integer  "tomo"
    t.integer  "ley"
    t.integer  "decreto"
    t.date     "promu"
    t.integer  "veto"
    t.integer  "tipoveto"
    t.integer  "expveto"
    t.date     "caducado"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "expediente_id"
  end

  add_index "finals", ["expediente_id"], :name => "index_finals_on_expediente_id"
  add_index "finals", ["numero"], :name => "index_finals_on_numero"

  create_table "prefers", :force => true do |t|
    t.integer  "numero"
    t.string   "letra",      :limit => 3
    t.integer  "tipo"
    t.integer  "pasada"
    t.integer  "preferen"
    t.date     "fechapref"
    t.date     "fechasol"
    t.integer  "tratado"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "senados", :force => true do |t|
    t.integer  "codigo"
    t.string   "nombre",     :limit => 30
    t.string   "sexo",       :limit => 1
    t.string   "bloque",     :limit => 3
    t.string   "direccion",  :limit => 25
    t.string   "telefono",   :limit => 8
    t.string   "localidad",  :limit => 25
    t.string   "cp",         :limit => 5
    t.date     "inicio"
    t.date     "fin"
    t.string   "profesion",  :limit => 15
    t.string   "foto",       :limit => 10
    t.integer  "mc"
    t.integer  "peri1"
    t.integer  "peri2"
    t.integer  "peri3"
    t.integer  "peri4"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "sesions", :force => true do |t|
    t.integer  "numero"
    t.integer  "tipo"
    t.string   "letra",         :limit => 3
    t.integer  "pasada"
    t.integer  "tipoperiod"
    t.integer  "numperiodo"
    t.integer  "ordendia"
    t.date     "fechaordia"
    t.integer  "numreunion"
    t.integer  "numsesion"
    t.integer  "asunto"
    t.date     "fechases"
    t.integer  "tratamient"
    t.integer  "resuvotac"
    t.integer  "comision1"
    t.integer  "comision2"
    t.integer  "comision3"
    t.integer  "comision4"
    t.integer  "comision5"
    t.integer  "comision6"
    t.text     "observ"
    t.integer  "wp"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "expediente_id"
  end

  add_index "sesions", ["expediente_id"], :name => "index_sesions_on_expediente_id"
  add_index "sesions", ["numero"], :name => "index_sesions_on_numero"

  create_table "status", :force => true do |t|
    t.integer  "estado"
    t.string   "nombre",     :limit => 20
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "temas", :force => true do |t|
    t.integer  "tema"
    t.string   "nombre",     :limit => 25
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
