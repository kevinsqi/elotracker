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

ActiveRecord::Schema.define(:version => 20120728071842) do

  create_table "leagues", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.boolean  "is_public",    :default => true
    t.boolean  "is_completed", :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "player_one_id"
    t.integer  "player_two_id"
    t.decimal  "score"
    t.integer  "league_id"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "matches", ["league_id"], :name => "index_matches_on_league_id"
  add_index "matches", ["player_one_id"], :name => "index_matches_on_player_one_id"
  add_index "matches", ["player_two_id"], :name => "index_matches_on_player_two_id"

  create_table "player_ratings", :force => true do |t|
    t.integer  "rating"
    t.integer  "player_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "k_factor"
    t.boolean  "is_professional", :default => false
    t.integer  "match_id"
  end

  add_index "player_ratings", ["player_id"], :name => "index_player_ratings_on_player_id"

  create_table "players", :force => true do |t|
    t.text     "name"
    t.integer  "league_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "players", ["league_id"], :name => "index_players_on_league_id"

end
