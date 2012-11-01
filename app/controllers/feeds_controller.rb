class FeedsController < ApplicationController

  def index

  	@property = params[:slug]
		@twitter_lists = TwitterList.all
  	if @property.nil?
  		@image_tweets = Tweet.order("created_at DESC").all
  		@property = "All"
  	else
			@image_tweets = Tweet.order('created_at DESC').joins(:twitter_list_tweets).joins(:twitter_lists).where('twitter_lists.list_slug = ?', @property)
    end
  end

end
