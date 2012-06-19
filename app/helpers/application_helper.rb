module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title(page_title)
	base_title = "Ruby Jem"
	if page_title.empty?
	  base_title
	else
	  "#{base_title} | #{page_title}"
	end
	end
	
	# If current_website exist, load default_css & default_layout model when view website
	def default_layout
		@default_layout = @website.codes.find_by_name('default_layout')
		raw("#{@default_layout.content}")
	end

	def default_css
		@default_css = @website.codes.find_by_name('default_css')
		raw("#{@default_css.content}")
  	end

  	def default_head
  		@default_head = @website.codes.find_by_name('default_head')
  		raw("#{@default_head.content}")
  	end
end
