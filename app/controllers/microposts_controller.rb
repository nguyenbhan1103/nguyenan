class MicropostsController < ApplicationController

	before_action :logged_in_user, only: [:create, :destroy]

  	def create
  		@micropost = current_user.microposts.build(micropost_params)
    	if @micropost.save
      	flash[:success] = "Entry created!"
      	redirect_to root_url
    	else
        @feed_items = []
      	render 'static_pages/home'
    	end
  	end

  	def destroy
  		
  	end

    

  	private

    	def micropost_params
      		params.require(:micropost).permit(:content)
    	end


      # Before filters

      # Confirms the correct user.
      def correct_micropost
        @micropost = Micropost.find(params[:id])
        redirect_to(root_url) unless current_micropost?(@micropost)
      end

end
