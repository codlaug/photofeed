class FeedsController < ApplicationController

  def index

  	@property = params[:show]

    @image_tweets = Tweet.joins(:twitter_lists).where("twitter_lists.name like ?", @property)
    
  end

end