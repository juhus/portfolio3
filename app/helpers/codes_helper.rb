module CodesHelper
  def new
  	@code = Code.new
  end
  def create
  	@code = @website.codes.new(params[:code])
  	if @code.save
  		redirect_to @website
  	else
  		render 'new'
  	end
  end
end
