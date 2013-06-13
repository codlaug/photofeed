class FeedsController < ApplicationController


  def show
		@pods = Pod.all
  	
    pod = Pod.find params[:id]
    pod.check_instagram

		@posts = Kaminari.paginate_array(pod.interweb_posts).page(params[:page]).per(40)
    

  end

  def index
    @pods = Pod.all

    @posts = InterwebPost.order('twitter_created_at DESC').limit(40)
    
    render :show
  end


end
