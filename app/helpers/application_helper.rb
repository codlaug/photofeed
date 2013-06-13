module ApplicationHelper


  def pods_button
    link_to 'Pods', pods_path(), :class => 'btn btn-small pods-button'
  end

  def feeds_button
    link_to 'Feeds', feeds_path(), :class => 'btn btn-small feeds-button'
  end

  def instagram_button instagram_account_id, options = {}
    link_to options[:text] || 'Log in to Instagram', Instagram.authorize_url(:redirect_uri => INSTAGRAM_CALLBACK_URL + "?state=#{instagram_account_id}"), :class => 'instagram-login-logout btn'
  end

  def consume_feed_button checked
    content_tag :button, { type: "button", class: "js-consume-feed-button btn btn-info #{'active' if checked}", data: { toggle: "button" } } do
      content_tag( :i, '', class: (checked ? 'icon-check' : 'icon-check-empty') ) + " Pull in posts from this account's feed"
    end
  end

end
