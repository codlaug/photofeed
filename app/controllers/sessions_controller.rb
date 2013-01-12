class SessionsController < ApplicationController

  def new
    response = Instagram.get_access_token(params[:code], :redirect_uri => INSTAGRAM_CALLBACK_URL)
    session[:instagram_access_token] = response.access_token
    user = Instagram.client(:access_token => session[:instagram_access_token]).user
    session[:instagram_name] = user.full_name || user.user_name

    redirect_to feed_path
  end

  def destroy
    session.delete :instagram_access_token

    redirect_to feed_path
  end

end