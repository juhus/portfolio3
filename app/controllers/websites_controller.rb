class WebsitesController < ApplicationController
  before_filter :signed_in_user

	  def new
	 	  @website = Website.new
  	end

  	def create
  		@website = Website.new(params[:website])
  		@website.user_id = current_user.id
  		@website.save
  		redirect_to @website
  	end

  	def show
  		@website = Website.find(params[:id])
      @code = Code.new
      @portfolio = Portfolio.new
  	end
end