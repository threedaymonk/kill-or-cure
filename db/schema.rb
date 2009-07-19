# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090719224733) do

  create_table "articles", :force => true do |t|
    t.text     "link"
    t.text     "title"
    t.text     "summary"
    t.integer  "votes_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "normalized_taggings", :force => true do |t|
    t.integer "normalized_term_id"
    t.integer "article_id"
    t.boolean "good"
    t.integer "votes_against",      :default => 0
  end

  create_table "normalized_terms", :force => true do |t|
    t.string "value"
  end

  create_table "taggings", :force => true do |t|
    t.integer "term_id"
    t.integer "article_id"
    t.boolean "good"
  end

  create_table "terms", :force => true do |t|
    t.string  "value"
    t.integer "normalized_term_id"
  end

  create_table "votes", :force => true do |t|
    t.text     "general"
    t.text     "specific"
    t.string   "effect"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
  end

end
