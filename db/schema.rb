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

ActiveRecord::Schema.define(version: 20_210_823_122_623) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "freaks", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "norm_id"
    t.bigint "role_id"
  end

  create_table 'freaks', force: :cascade do |t|
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'norm_id'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.bigint 'role_id'
  end

  create_table "photos", force: :cascade do |t|
    t.string "uri"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_photos_on_imageable"
  end

  create_table 'freaks_projects', force: :cascade do |t|
    t.bigint 'freak_id'
    t.bigint 'project_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['freak_id'], name: 'index_freaks_projects_on_freak_id'
    t.index ['project_id'], name: 'index_freaks_projects_on_project_id'
  end


  create_table 'freaks_technologies', force: :cascade do |t|
    t.bigint 'freak_id'
    t.bigint 'technology_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['freak_id'], name: 'index_freaks_technologies_on_freak_id'
    t.index ['technology_id'], name: 'index_freaks_technologies_on_technology_id'
  end

  create_table 'norms', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table 'projects', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'projects_technologies', force: :cascade do |t|
    t.bigint 'project_id'
    t.bigint 'technology_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['project_id'], name: 'index_projects_technologies_on_project_id'
    t.index ['technology_id'], name: 'index_projects_technologies_on_technology_id'
  end

  create_table 'technologies', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key 'freaks_technologies', 'freaks'
  add_foreign_key 'freaks_technologies', 'technologies'
  add_foreign_key 'projects_technologies', 'projects'
  add_foreign_key 'projects_technologies', 'technologies'
  add_foreign_key 'freaks', 'roles'
  add_foreign_key 'freaks', 'norms'
end
