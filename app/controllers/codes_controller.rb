class CodesController < ApplicationController
  before_filter :signed_in_user
  before_filter :get_website, except: [:new]
  before_filter :get_code, except: [:new, :create]

  def get_code
    @code = @website.codes.find(params[:id])
  end

  def create
  	@code = @website.codes.new(params[:code])  	
    respond_to do |format|
      if @code.save
    		format.html { redirect_to @website }
        format.js
    	else
    		format.html { render 'new' }
    	end      
    end
  end

  def show
  end

  def edit
    respond_to do |format|
      format.html 
      format.js
    end
  end

  def update
    @code.update_attributes(params[:code])
    respond_to do |format|
      format.html {redirect_to @website}
      format.js 
    end
  end

  def destroy
    @code.destroy
    respond_to do |format|
      format.html { redirect_to @website}
      format.js
    end
  end
end