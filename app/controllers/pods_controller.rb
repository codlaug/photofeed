class PodsController < ApplicationController

  def index
    @pods = Pod.includes(:twitter_list, :instagram_account).all
  end

  def edit
    @pod = Pod.find params[:id]
    @pod.build_instagram_account if @pod.instagram_account.nil?
  end

  def update
    pod = Pod.find params[:id]
    pod.update_attributes! params[:pod]
    flash[:notice] = "Okay! #{pod.name} was successfully updated."
    redirect_to pods_path()
  end

  def new
    @pod = Pod.new
    @pod.build_web_accounts
  end

  def create
    pod = Pod.new
    pod.build_web_accounts
    pod.update_attributes! params[:pod]
    redirect_to edit_pod_path(pod)
  end

  def set_instagram_access_token
    instagram_account = InstagramAccount.find params[:state]
    response = Instagram.get_access_token(params[:code], :redirect_uri => INSTAGRAM_CALLBACK_URL + "?state=#{params[:state]}")
    if response.user.username

      if response.user.username == instagram_account.username
        instagram_account.access_token = response.access_token
        instagram_account.save!
        flash[:notice] = "Sweet! PicDrop captured the access token from Instagram. Now we will pull from this account's feed every few minutes."
      else
        flash[:error] = "Shit! The usernames didn't match. Are you already logged into Instagram as another account?"
      end
      
    else
      flash[:error] = "This can't be happening! Something went wrong and it probably looks like this: #{response.inspect}"
    end

    redirect_to edit_pod_path(instagram_account.pod)
  end

end