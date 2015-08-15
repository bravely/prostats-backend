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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150815060636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "played_at"
    t.text     "notes"
    t.string   "youtube_picks"
    t.string   "youtube_start"
    t.string   "twitch_picks"
    t.string   "twitch_start"
    t.integer  "blue_team_id"
    t.integer  "red_team_id"
    t.integer  "league_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "lolesports_id"
    t.integer  "game_length"
    t.integer  "winner_id"
    t.string   "legs_url"
    t.integer  "game_number"
    t.string   "youtube_url"
    t.integer  "match_id"
  end

  add_index "games", ["blue_team_id"], name: "index_games_on_blue_team_id", using: :btree
  add_index "games", ["league_id"], name: "index_games_on_league_id", using: :btree
  add_index "games", ["match_id"], name: "index_games_on_match_id", using: :btree
  add_index "games", ["played_at"], name: "index_games_on_played_at", using: :btree
  add_index "games", ["red_team_id"], name: "index_games_on_red_team_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.string   "region"
    t.string   "abbr"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "lolesports_id"
  end

  add_index "leagues", ["name"], name: "index_leagues_on_name", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "lolesports_id"
    t.datetime "played_at"
    t.boolean  "live"
    t.boolean  "finished"
    t.integer  "max_games"
    t.string   "name"
    t.integer  "tournament_id"
    t.integer  "winner_id"
    t.integer  "blue_team_id"
    t.integer  "red_team_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "matches", ["blue_team_id"], name: "index_matches_on_blue_team_id", using: :btree
  add_index "matches", ["red_team_id"], name: "index_matches_on_red_team_id", using: :btree
  add_index "matches", ["tournament_id"], name: "index_matches_on_tournament_id", using: :btree
  add_index "matches", ["winner_id"], name: "index_matches_on_winner_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "handle"
    t.integer  "position"
    t.integer  "season_wins"
    t.integer  "season_losses"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "team_id"
    t.integer  "lolesports_id"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "starter"
    t.string   "hometown"
    t.datetime "contract_expires_at"
    t.string   "residency"
    t.string   "facebook_url"
    t.string   "twitter_url"
  end

  add_index "players", ["handle"], name: "index_players_on_handle", using: :btree
  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "plays", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "team_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "kills"
    t.integer  "deaths"
    t.integer  "assists"
    t.decimal  "kda"
    t.integer  "champion_id"
    t.integer  "end_level"
    t.integer  "total_gold"
    t.integer  "minions_killed"
    t.integer  "first_spell"
    t.integer  "second_spell"
    t.integer  "item0"
    t.integer  "item1"
    t.integer  "item2"
    t.integer  "item3"
    t.integer  "item4"
    t.integer  "item5"
  end

  add_index "plays", ["game_id"], name: "index_plays_on_game_id", using: :btree
  add_index "plays", ["player_id"], name: "index_plays_on_player_id", using: :btree
  add_index "plays", ["team_id"], name: "index_plays_on_team_id", using: :btree

  create_table "series", force: :cascade do |t|
    t.integer  "lolesports_id"
    t.string   "name"
    t.string   "season"
    t.integer  "league_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "series", ["league_id"], name: "index_series_on_league_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "league_id"
    t.integer  "lolesports_id"
    t.string   "acronym"
    t.integer  "wins",          default: 0
    t.integer  "losses",        default: 0
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.integer  "lolesports_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "name"
    t.boolean  "finished"
    t.integer  "league_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "series_id"
  end

  add_index "tournaments", ["league_id"], name: "index_tournaments_on_league_id", using: :btree
  add_index "tournaments", ["series_id"], name: "index_tournaments_on_series_id", using: :btree

  add_foreign_key "games", "matches"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "players", "teams"
  add_foreign_key "plays", "games"
  add_foreign_key "plays", "players"
  add_foreign_key "plays", "teams"
  add_foreign_key "teams", "leagues"
end
