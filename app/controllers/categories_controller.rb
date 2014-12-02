class CategoriesController < ApplicationController

	def fetch_all
		begin
			output current_session.user.client.categories
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def fetch
		begin
			output current_session.user.client.categories.find(params[:id])
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	
	def create
		begin
			category = current_session.user.client.categories.new(categories_params)
			if category.save
				output category
			else
				render :json => category.errors, :status => :unprocessable_entity
			end
	
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def update
		begin
			category = current_session.user.client.categories.find(params[:id])
		
			if category.update_attributes(categories_params)
				output category
			else
				render :json => category.errors, :status => :unprocessable_entity
			end
		
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def destroy
		begin
			category = current_session.user.client.categories.find(params[:id])
			category.destroy
			head :no_content
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	private
	
	def categories_params
		params.require(:category).permit(:name, :description, :automatic, :available, :image)
	end

end
