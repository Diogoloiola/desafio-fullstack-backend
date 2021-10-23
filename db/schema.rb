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

ActiveRecord::Schema.define(version: 2021_10_23_145849) do

  create_table "users", id: false, force: :cascade do |t|
    t.string "id"
    t.string "gender"
    t.string "title_name"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.date "birth_date"
    t.integer "age"
    t.date "registered_date"
    t.integer "age_registred"
    t.string "phone"
    t.string "cell"
    t.string "id_name"
    t.string "id_value"
    t.string "nationality"
    t.string "username"
    t.string "password"
    t.string "salt"
    t.string "md5"
    t.string "sha1"
    t.string "sha256"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
