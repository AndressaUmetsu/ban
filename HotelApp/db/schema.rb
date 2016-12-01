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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161201112922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string   "nome",       null: false
    t.string   "endereco"
    t.string   "telefone",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empregados", force: :cascade do |t|
    t.string   "nome",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estadias", force: :cascade do |t|
    t.date     "data_checkin",  null: false
    t.date     "data_checkout", null: false
    t.integer  "cliente_id",    null: false
    t.integer  "quarto_id",     null: false
    t.integer  "hotel_id",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cliente_id"], name: "index_estadias_on_cliente_id", using: :btree
    t.index ["hotel_id"], name: "index_estadias_on_hotel_id", using: :btree
    t.index ["quarto_id"], name: "index_estadias_on_quarto_id", using: :btree
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "nome",       null: false
    t.string   "endereco",   null: false
    t.string   "telefone",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "limpezas", force: :cascade do |t|
    t.date     "data",       null: false
    t.time     "hora",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quartos", force: :cascade do |t|
    t.integer  "hotel_id",       null: false
    t.integer  "tipo_quarto_id", null: false
    t.integer  "num",            null: false
    t.integer  "andar",          null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["hotel_id"], name: "index_quartos_on_hotel_id", using: :btree
    t.index ["tipo_quarto_id"], name: "index_quartos_on_tipo_quarto_id", using: :btree
  end

  create_table "reservas", force: :cascade do |t|
    t.date     "data_reserva",  null: false
    t.date     "data_checkin",  null: false
    t.date     "data_checkout", null: false
    t.decimal  "valor_entrada", null: false
    t.integer  "quarto_id",     null: false
    t.integer  "hotel_id",      null: false
    t.integer  "cliente_id",    null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cliente_id"], name: "index_reservas_on_cliente_id", using: :btree
    t.index ["hotel_id"], name: "index_reservas_on_hotel_id", using: :btree
    t.index ["quarto_id"], name: "index_reservas_on_quarto_id", using: :btree
  end

  create_table "servicos", force: :cascade do |t|
    t.date     "dataCheckIn"
    t.date     "data",            null: false
    t.time     "hora",            null: false
    t.integer  "tipo_servico_id", null: false
    t.integer  "estadia_id",      null: false
    t.integer  "quarto_id",       null: false
    t.integer  "hotel_id",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["estadia_id"], name: "index_servicos_on_estadia_id", using: :btree
    t.index ["hotel_id"], name: "index_servicos_on_hotel_id", using: :btree
    t.index ["quarto_id"], name: "index_servicos_on_quarto_id", using: :btree
    t.index ["tipo_servico_id"], name: "index_servicos_on_tipo_servico_id", using: :btree
  end

  create_table "tipo_quartos", force: :cascade do |t|
    t.string   "nome",       null: false
    t.decimal  "preco",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_servicos", force: :cascade do |t|
    t.string   "nome",       null: false
    t.decimal  "custo",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "estadias", "clientes"
  add_foreign_key "estadias", "hotels"
  add_foreign_key "estadias", "quartos"
  add_foreign_key "quartos", "hotels"
  add_foreign_key "quartos", "tipo_quartos"
  add_foreign_key "reservas", "clientes"
  add_foreign_key "reservas", "hotels"
  add_foreign_key "reservas", "quartos"
  add_foreign_key "servicos", "estadias"
  add_foreign_key "servicos", "hotels"
  add_foreign_key "servicos", "quartos"
  add_foreign_key "servicos", "tipo_servicos"
end
