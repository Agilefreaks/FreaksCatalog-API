# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_820_105_512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'freak_technologies', force: :cascade do |t|
    t.bigint 'freak_id'
    t.bigint 'technology_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['freak_id'], name: 'index_freak_technologies_on_freak_id'
    t.index ['technology_id'], name: 'index_freak_technologies_on_technology_id'
  end

  create_table 'freaks', force: :cascade do |t|
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
  end

  create_table 'photos', force: :cascade do |t|
    t.string 'uri'
    t.string 'imageable_type'
    t.bigint 'imageable_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[imageable_type imageable_id], name: 'index_photos_on_imageable'
  end

  create_table 'technologies', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'freak_technologies', 'freaks'
  add_foreign_key 'freak_technologies', 'technologies'
end
