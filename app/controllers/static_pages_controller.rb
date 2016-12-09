class StaticPagesController < ApplicationController
  def home
  	if logged_in?
      @comment  = current_user.comments.build
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @feed_items = Micropost.all.paginate(page: params[:page], :per_page => 5)
    end
    
  end

  def help
  end

  def about
  end
  
end
