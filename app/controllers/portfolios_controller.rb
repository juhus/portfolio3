class PortfoliosController < ApplicationController
  layout "frontend", only: [:index, :show]
  before_filter :signed_in_user
  before_filter :get_website, except: [:new]
  before_filter :get_portfolio, except: [:new, :create]

  def get_portfolio
    @portfolio = @website.portfolios.find(params[:id])
  end

  def create
  	@portfolio = @website.portfolios.new(params[:portfolio])
  	respond_to do |format|
      if @portfolio.save
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
    @portfolio.update_attributes(params[:portfolio])
    respond_to do |format|
      format.html {redirect_to @website}
      format.js
    end
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to @website}
      format.js
    end
  end
end