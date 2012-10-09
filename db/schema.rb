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

ActiveRecord::Schema.define(:version => 20121009062639) do

  create_table "pod_twitter_lists", :force => true do |t|
    t.integer  "pod_id"
    t.integer  "twitter_list_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "pods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tweets", :force => true do |t|
    t.string   "twitter_create_at"
    t.string   "twitter_id"
    t.string   "text"
    t.string   "source"
    t.string   "media_url"
    t.string   "media_url_https"
    t.string   "url"
    t.string   "display_url"
    t.string   "expanded_url"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "twitter_list_members", :force => true do |t|
    t.integer  "twitter_list_id"
    t.integer  "twitter_member_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "twitter_lists", :force => true do |t|
    t.string   "name"
    t.string   "owner_screen_name"
    t.string   "list_slug"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "twitter_member_tweets", :force => true do |t|
    t.integer  "twitter_member_id"
    t.integer  "tweet_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "twitter_members", :force => true do |t|
    t.string   "twitter_id"
    t.string   "name"
    t.string   "screen_name"
    t.string   "location"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
