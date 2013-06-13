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

ActiveRecord::Schema.define(:version => 20130613205045) do

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

  create_table "instagram_accounts", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "last_query_at"
    t.string   "access_token"
    t.integer  "pod_id"
    t.boolean  "consume_from_feed"
  end

  add_index "instagram_accounts", ["pod_id"], :name => "index_instagram_accounts_on_pod_id"

  create_table "instagram_users", :force => true do |t|
    t.string   "instagram_id"
    t.string   "username"
    t.integer  "instagram_account_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "instagram_users", ["instagram_account_id"], :name => "index_instagram_users_on_instagram_account_id"

  create_table "interweb_posts", :force => true do |t|
    t.string   "twitter_create_at"
    t.string   "twitter_id"
    t.text     "text"
    t.string   "source"
    t.string   "media_url"
    t.string   "media_url_https"
    t.string   "url"
    t.string   "display_url"
    t.string   "expanded_url"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "profile_image_url"
    t.string   "username"
    t.string   "usericon"
    t.string   "user_id"
    t.datetime "twitter_created_at"
    t.string   "type"
    t.integer  "instagram_account_id"
  end

  add_index "interweb_posts", ["instagram_account_id"], :name => "index_interweb_posts_on_instagram_account_id"
  add_index "interweb_posts", ["twitter_created_at"], :name => "index_tweets_on_twitter_created_at"
  add_index "interweb_posts", ["type"], :name => "index_interweb_posts_on_type"

  create_table "members", :force => true do |t|
    t.string   "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members_twitter_lists", :force => true do |t|
    t.integer  "twitter_list_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members_twitter_lists", ["member_id"], :name => "index_members_twitter_lists_on_member_id"
  add_index "members_twitter_lists", ["twitter_list_id"], :name => "index_members_twitter_lists_on_twitter_list_id"

  create_table "pods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pods", ["name"], :name => "index_pods_on_name"

  create_table "tweets_twitter_lists", :force => true do |t|
    t.integer  "twitter_list_id"
    t.integer  "tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets_twitter_lists", ["tweet_id"], :name => "index_tweets_twitter_lists_on_tweet_id"
  add_index "tweets_twitter_lists", ["twitter_list_id"], :name => "index_tweets_twitter_lists_on_twitter_list_id"

  create_table "twitter_lists", :force => true do |t|
    t.string   "owner_screen_name"
    t.string   "list_slug"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "pod_id"
  end

  add_index "twitter_lists", ["pod_id"], :name => "index_twitter_lists_on_pod_id"

end
