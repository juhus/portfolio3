class WebsitesController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user
  before_filter :get_website_here, except: :create 
  	
    def create
  		@website = Website.new(params[:website])
  		@website.user_id = current_user.id
      respond_to do |format|
        if @website.save
          format.html { redirect_to @website }
          format.js
        else
          redirect_to website_path(@website)
        end      
      end
  	end

    def show
      store_location
      @user = current_user
    end

  	def update
      @website.update_attributes(params[:website])
      redirect_to @website
  	end

    def destroy
      @website.destroy
      respond_to do |format|
        format.html { redirect_back_or (@website.next)}
        format.js
      end
    end

    def get_website_here
      @website = Website.find_by_title(params[:id])
    end
end