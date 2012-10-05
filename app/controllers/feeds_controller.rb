class FeedsController < ApplicationController

  def index
    @image_tweets = [{:image_uri => "http://twitpic.com/show/thumb/8jkiwq.jpg", :user => "Duncanjm703", :text => "omg wtf bbq"},
                     {:image_uri => "http://twitpic.com/show/thumb/4gzetu.jpg", :user => "Duncanjm703", :text => "WOW"}]
  end

end