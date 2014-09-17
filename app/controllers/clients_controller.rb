class ClientsController < ApplicationController
	
	def fetch
	    begin
	        output current_session.user.client
	    rescue Exception => exception
	        error exception.message, :not_found
	    end
	end
	
	def self_update
	    begin
	        client = current_session.user.client
	
	        if client.update_attributes(client_params)
	    		output client
	        else
	            render :json => client, :status => :unprocessable_entity
	        end
	            
	    rescue Exception => exception
	        error exception.message, :not_found
	    end
	end
	
	
	
	def fetch_all
		begin
			clients = Client.all
			output clients
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def fetch
		begin
			client = Client.find(params[:id])
			output client
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def destroy
		begin
			client = Client.find(params[:id])
			client.destroy
			head :no_content
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def update
		begin
			client = Client.find(params[:id])
	
			if client.update_attributes(client_params)
				output client
			else
				render :json => client, :status => :unprocessable_entity
		end
	    
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	
	def create
		begin
	  client = Client.new(params[:client])
	  if client.save
	    render :json => client, :status => :created
	  else
	    render :json => client.errors, :status => :unprocessable_entity 
	  end
	rescue Exception => exception
	  error exception.message, :not_found
	end
	
	end
	
	
	private
	
	def client_params
		params.require(:client).permit( :name, :email, :address, :www, :twitter, :facebook, :phone, :logo)
	end
  
  
end
