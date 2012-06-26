module PortfoliosHelper
	def navigateleft(z)
		list = Portfolio.publish.all.collect{|i| i.id}
		for x in list
			if(x == z)
				@current_position = x
			end
		end
		if(@current_position == list.first)
			@previous_position = list.last
		else
			@previous_position = @current_position-1
		end
			dest_portfolio = Portfolio.find(@previous_position)
		return "#{dest_portfolio.permalink}"
	end

	def navigateright(z)
		list = Portfolio.publish.all.collect{|i| i.id}
		for x in list
			if(x == z)
				@current_position = x
			end
		end
		if(@current_position == list.last)
			@next_position = list.first
		else
			@next_position = @current_position+1
		end
		dest_portfolio = Portfolio.find(@next_position)
		return "#{dest_portfolio.permalink}"
	end
	
end
