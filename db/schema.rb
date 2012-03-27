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

ActiveRecord::Schema.define(:version => 20120327201517) do

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

end
