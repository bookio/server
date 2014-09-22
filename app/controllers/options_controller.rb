class OptionsController < ApplicationController


	def fetch_all
		begin
			output current_session.user.client.options.all()
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
  
	def fetch
		begin
			output current_session.user.client.options.find(params[:id])
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def fetch_by_rental_id
		begin
		  
			#output Option.where(:client_id => current_session.user.client.id, :rental_id => params[:rental_id]).all()
	  
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	
	def create
		begin
			option = current_session.user.client.options.new(options_params)
		
			if option.save
				output option
			else
				render :json => option.errors, :status => :unprocessable_entity
			end
	
		rescue Exception => exception
			error exception.message, :not_found
		end
	
	end
	
	def update
		begin
			option = current_session.user.client.options.find(params[:id])
	
			if option.update_attributes(options_params)
				output option
			else
				render :json => rental.option, :status => :unprocessable_entity
			end
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def destroy
		begin
			option = current_session.user.client.options.find(params[:id])
			option.destroy
		
			head :no_content
		
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	private
	
	def options_params
	  params.require(:option).permit(:description, :name, :client_id)
	
	end
	

end
