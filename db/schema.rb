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

ActiveRecord::Schema.define(:version => 1) do

  create_table "carousel_carousels", :force => true do |t|
    t.string   "label",      :null => false
    t.string   "identifier", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "carousel_carousels", ["identifier"], :name => "index_carousel_carousels_on_identifier"

  create_table "carousel_slides", :force => true do |t|
    t.integer  "carousel_id",                      :null => false
    t.string   "label",                            :null => false
    t.text     "content"
    t.string   "url"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.integer  "position",          :default => 0, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "carousel_slides", ["carousel_id", "position"], :name => "index_carousel_slides_on_carousel_id_and_position"

end
