class FeedController < ApplicationController
  def index
		# render :layout => false
  	@property = params[:slug]
		@twitter_lists = TwitterList.all
  	if @property.nil?
  		@image_tweets = Tweet.order('twitter_created_at DESC').page params[:page]
  		@property = "All"
  	else
			@image_tweets = Tweet.order('twitter_created_at DESC').joins(:twitter_list_tweets).joins(:twitter_lists).where('twitter_lists.list_slug = ?', @property).page params[:page]

    end
  end
end
