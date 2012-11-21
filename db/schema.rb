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

ActiveRecord::Schema.define(:version => 20121121180252) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "members", :force => true do |t|
    t.string   "user_id"
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
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "profile_image_url"
    t.string   "username"
    t.string   "usericon"
    t.string   "user_id"
    t.datetime "twitter_created_at"
  end

  add_index "tweets", ["twitter_created_at"], :name => "index_tweets_on_twitter_created_at", :order => {"twitter_created_at"=>:desc}

  create_table "twitter_list_members", :force => true do |t|
    t.integer  "twitter_list_id"
    t.integer  "member_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "twitter_list_tweets", :force => true do |t|
    t.integer  "twitter_list_id"
    t.integer  "tweet_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "twitter_lists", :force => true do |t|
    t.string   "name"
    t.string   "owner_screen_name"
    t.string   "list_slug"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",                    :null => false
    t.string   "password_salt",                       :null => false
    t.string   "email",                               :null => false
    t.string   "persistence_token",                   :null => false
    t.string   "single_access_token",                 :null => false
    t.string   "perishable_token",                    :null => false
    t.integer  "login_count",         :default => 0,  :null => false
    t.integer  "failed_login_count",  :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "name",                :default => "", :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
