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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "citas", primary_key: "id_cita", id: :serial, force: :cascade do |t|
    t.integer "id_servicio", null: false
    t.string "usuario", limit: 12, null: false
    t.integer "id_mascota", null: false
    t.date "fecha", null: false
  end

  create_table "mascotas", primary_key: "id_mascota", id: :serial, force: :cascade do |t|
    t.string "nombre", limit: 12, null: false
    t.string "usuario", limit: 12, null: false
    t.string "tipo_animal", limit: 12, null: false
    t.string "raza", limit: 20
    t.string "genero", limit: 30, null: false
    t.integer "esterilizado", default: 1
    t.float "longitud", null: false
    t.float "peso", null: false
    t.string "vacunas", limit: 30, null: false
    t.string "imagen", limit: 1000
  end

  create_table "productos", primary_key: "id_producto", id: :serial, force: :cascade do |t|
    t.string "referencia", limit: 10, null: false
    t.string "descripcion", limit: 30, null: false
    t.string "marca", limit: 10, null: false
    t.float "precio", null: false
    t.string "imagen", limit: 1000
  end

  create_table "servicios", primary_key: "id_servicio", id: :serial, force: :cascade do |t|
    t.string "nombre", limit: 30, null: false
    t.float "precioxservicio", null: false
    t.string "descripcion", limit: 4000, null: false
    t.string "imagen", limit: 2000
  end

  create_table "usuarios", primary_key: "usuario", id: { type: :string, limit: 12 }, force: :cascade do |t|
    t.string "nombre", limit: 12, null: false
    t.string "password", limit: 12, null: false
    t.integer "tipousuario", default: 1
    t.string "direccion", limit: 30, null: false
    t.string "ciudad", limit: 20, null: false
    t.integer "codigopostal", null: false
    t.string "telefono", limit: 10, null: false
    t.string "correo", limit: 30, null: false
    t.integer "status", default: 1
  end

  add_foreign_key "citas", "mascotas", column: "id_mascota", primary_key: "id_mascota", name: "citas_id_mascota_fkey"
  add_foreign_key "citas", "servicios", column: "id_servicio", primary_key: "id_servicio", name: "citas_id_servicio_fkey"
  add_foreign_key "citas", "usuarios", column: "usuario", primary_key: "usuario", name: "citas_usuario_fkey"
  add_foreign_key "mascotas", "usuarios", column: "usuario", primary_key: "usuario", name: "mascotas_usuario_fkey"
end
