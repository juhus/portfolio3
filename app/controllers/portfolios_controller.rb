class PortfoliosController < ApplicationController
  layout "frontend", only: [:show ]
  before_filter :signed_in_user, except: [:default, :show]
  before_filter :get_website, except: [:default, :show]
  before_filter :get_portfolio, except: [:default, :create, :show, :sort, :index]

  def index
    @portfolios = @website.portfolios.order("position")
  end

  def default
    @website = Website.first
    @portfolio = @website.portfolios.where(publish:true).first
    redirect_to view_path(@website.title, @portfolio.permalink)
  end

  def create
  	@portfolio = @website.portfolios.new(params[:portfolio])
  	respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @website }
        format.js
      else
        redirect_to edit_website_path(@website.title)
      end      
    end
  end

  def show
      @website = Website.find_by_title(params[:title])
      @portfolio = @website.portfolios.find_by_permalink(params[:permalink])
      if (@portfolio.publish == false)
        redirect_back_or root_path
      end
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
  
  def get_portfolio
    @portfolio = @website.portfolios.find(params[:id])
  end  

  def sort
    params[:portfolio].each_with_index do |id, index|
      @website.portfolios.update_all({position: index+1}, {id: id})
      end
    render nothing: true
  end

end