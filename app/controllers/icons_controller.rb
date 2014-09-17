class IconsController < ApplicationController


	
	# Return all icons
	def fetch_all
		begin
			output Icon.all      
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	# Return all tags as an array
	def fetch_tags
		begin
			icons = Icon.select("DISTINCT tag").where("tag <> ''").order('tag')
			result = []
	
			icons.each do |icon|
				result.push(icon.tag)
			end
	
			output result
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	

	private
	
	def icons_params
		params.require(:icon).permit(:image, :name, :tags, :folder)

	end
  
end
