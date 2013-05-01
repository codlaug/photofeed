module ApplicationHelper


  def pods_button
    link_to 'Pods', pods_path(), :class => 'btn pods-button'
  end

  def feeds_button
    link_to 'Feeds', feeds_path(), :class => 'btn feeds-button'
  end

  def instagram_button instagram_account_id, options = {}
    link_to options[:text] || 'Log in to Instagram', Instagram.authorize_url(:redirect_uri => INSTAGRAM_CALLBACK_URL + "?state=#{instagram_account_id}"), :class => 'instagram-login-logout btn'
  end


end
