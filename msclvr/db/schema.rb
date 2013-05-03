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

ActiveRecord::Schema.define(:version => 20130424043658) do

  create_table "affiliates", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false
  end

  add_index "affiliates", ["email"], :name => "index_affiliates_on_email", :unique => true
  add_index "affiliates", ["reset_password_token"], :name => "index_affiliates_on_reset_password_token", :unique => true

  create_table "links", :force => true do |t|
    t.string   "promotion_id"
    t.string   "url"
    t.string   "slug"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "networks", :force => true do |t|
    t.string   "network_name"
    t.string   "owner_first_name"
    t.string   "owner_last_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "promotions", :force => true do |t|
    t.integer  "affiliate_id"
    t.integer  "song_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "track_url"
    t.string   "slug"
    t.string   "short_url"
    t.string   "short_url2"
    t.string   "custom_ending"
  end

  create_table "songs", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "track_name"
    t.string   "artist_name"
    t.string   "track_price"
    t.string   "artworkurl100"
    t.string   "viewurl"
    t.string   "previewurl"
    t.string   "track_url"
  end

end
