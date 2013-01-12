class FeedsController < ApplicationController

  before_filter :check_instagram

  def show

  	@property = params[:slug]
		@twitter_lists = TwitterList.all
  	if @property.nil?
  		@image_tweets = InterwebPost.page params[:page]
  		@property = "All"
  	else
			@image_tweets = Tweet.order('twitter_created_at DESC').joins(:twitter_lists).where('twitter_lists.list_slug = ?', @property).page params[:page]
    end

  end

private
  
  def check_instagram

    if session[:instagram_access_token].present?
      if session[:last_instagram_query].blank? or Time.now - Time.at(session[:last_instagram_query]) > 5.minutes
        session[:last_instagram_query] = Time.now
      
        # initialize the instagram client with the access token we got when the user authenticated (see SessionsController)
        client = Instagram.client :access_token => session[:instagram_access_token]

        # store the user's instagram follows so we can get the correct ones from our database later
        session[:instagram_user_ids] = client.user_follows.collect(&:id)

        # Instagram has a 'min_id' attribute that will make the query only return items newer than the post with that id
        latest_post_id = InstagramPost.where(:user_id => session[:instagram_user_ids]).first || nil
        grams = client.user_media_feed :min_id => latest_post_id

        # create an entry for each of the results we got back from Instagram
        grams.data.each {|gram| InstagramPost.create_from_instagram_response_hash gram }
      end
    end
  end

end
