class FeedsController < ApplicationController

  def index

  	@property = params[:show]
  	if @property.nil?
  		@image_tweets = Tweet.all
  		@property = "All"
  	else
    	@image_tweets = Tweet.joins(:twitter_lists).where("twitter_lists.name like ?", @property)
    end
  end

end