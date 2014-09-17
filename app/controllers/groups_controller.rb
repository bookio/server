class GroupsController < ApplicationController

	def fetch_all
		begin
			output Group.all
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def fetch
		begin
			output Group.find(params[:id])
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def destroy
		begin
			group = Group.find(params[:id])
			group.destroy
			head :no_content
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def update
		begin
			group = Group.find(params[:id])
		
			if group.update_attributes(groups_params)
				output group
			else
				render :json => group, :status => :unprocessable_entity
			end
	 
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def create
		begin
			group = Group.new(groups_params)
			if group.save
				output group
			else
				render :json => group.errors, :status => :unprocessable_entity 
			end
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	private
	
	def groups_params
		params.require(:group).permit(:name)
	end
end
