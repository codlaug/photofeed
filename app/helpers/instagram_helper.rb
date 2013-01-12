module InstagramHelper

  def instagram_button
    if session[:instagram_access_token].present?
      content_tag :span, :class => 'instagram-login-logout' do
        raw "Hi, #{session[:instagram_name]}! " + link_to('Log out of Instagram', '/session', :method => :delete, :class => 'btn')
      end
    else
      link_to 'Log in to Instagram', Instagram.authorize_url(:redirect_uri => INSTAGRAM_CALLBACK_URL), :class => 'instagram-login-logout btn'
    end
  end

end
