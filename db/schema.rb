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

ActiveRecord::Schema.define(:version => 20120328132041) do

  create_table "asuntos", :force => true do |t|
    t.integer  "numero"
    t.string   "letra"
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
    t.integer  "comsion6"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "diputados", :force => true do |t|
    t.integer  "codigo"
    t.string   "nombre"
    t.string   "sexo"
    t.string   "bloque"
    t.string   "bloquea1"
    t.string   "bloquea2"
    t.string   "bloquea3"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "localidad"
    t.string   "cp"
    t.date     "inicio"
    t.date     "fin"
    t.string   "profesion"
    t.string   "foto"
    t.integer  "mc"
    t.integer  "peri1"
    t.integer  "peri2"
    t.integer  "peri3"
    t.integer  "peri4"
    t.date     "feci1"
    t.date     "fecs1"
    t.date     "fecs2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "estados", :force => true do |t|
    t.integer  "numero"
    t.integer  "tipo"
    t.string   "letra"
    t.integer  "pasada"
    t.date     "fechaent"
    t.integer  "comision"
    t.date     "tratamses"
    t.date     "fechasal"
    t.text     "dictmay"
    t.text     "dcitmin1"
    t.text     "dictmin2"
    t.date     "fechamay"
    t.date     "fechamin1"
    t.date     "fechamin2"
    t.integer  "v"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "expedientes", :force => true do |t|
    t.integer "numero"
    t.string  "letra",      :limit => 3
    t.integer "tipo"
    t.integer "pasada"
    t.integer "numsenado"
    t.integer "tema"
    t.text    "descrip"
    t.date    "fechaentr"
    t.string  "hora",       :limit => 5
    t.string  "autor",      :limit => 30
    t.text    "firmantes"
    t.integer "tipoentr"
    t.integer "tipoperiod"
    t.integer "numperiodo"
    t.string  "expte",      :limit => 10
    t.integer "estado"
    t.integer "ley"
    t.integer "marca"
    t.integer "etiq"
  end

  create_table "finals", :force => true do |t|
    t.integer  "numero"
    t.string   "letra",      :limit => 3
    t.integer  "tipo"
    t.integer  "pasada"
    t.integer  "nota"
    t.integer  "nronota"
    t.integer  "fechanota"
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prefers", :force => true do |t|
    t.integer  "numero"
    t.string   "letra"
    t.integer  "tipo"
    t.integer  "pasada"
    t.integer  "preferen"
    t.date     "fechapref"
    t.date     "fechasol"
    t.integer  "tratado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "senados", :force => true do |t|
    t.integer  "codigo"
    t.string   "nombre"
    t.string   "sexo"
    t.string   "bloque"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "localidad"
    t.string   "cp"
    t.date     "inicio"
    t.date     "fin"
    t.string   "profesion"
    t.string   "foto"
    t.integer  "mc"
    t.integer  "peri1"
    t.integer  "peri2"
    t.integer  "peri3"
    t.integer  "peri4"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sesions", :force => true do |t|
    t.integer  "numero"
    t.integer  "tipo"
    t.string   "letra"
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "temas", :force => true do |t|
    t.integer  "tema"
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipos", :force => true do |t|
    t.integer  "tipo"
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
