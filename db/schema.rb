# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_25_201209) do

  create_table "encomendas", force: :cascade do |t|
    t.string "remetente"
    t.date "data"
    t.integer "funcionario_id", null: false
    t.integer "morador_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["funcionario_id"], name: "index_encomendas_on_funcionario_id"
    t.index ["morador_id"], name: "index_encomendas_on_morador_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moradors", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "bloco"
    t.string "casanum"
    t.string "contato"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.integer "encomenda_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encomenda_id"], name: "index_produtos_on_encomenda_id"
  end

  add_foreign_key "encomendas", "funcionarios"
  add_foreign_key "encomendas", "moradors"
  add_foreign_key "produtos", "encomendas"
end
