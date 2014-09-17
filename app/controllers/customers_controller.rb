class CustomersController < ApplicationController
  
	def fetch_all
		begin
			output current_session.user.client.customers
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def fetch
		begin
			output current_session.user.client.customers.find(params[:id])
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def search
		begin
			output current_session.user.client.customers.where("name ILIKE ? OR email ILIKE ? OR phone ILIKE ?", "%#{params[:search_text]}%", "%#{params[:search_text]}%", "%#{params[:search_text]}%")
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def create
		begin
			customer = current_session.user.client.customers.new(customers_params)
	
			if customer.save
				output customer
			else
				render :json => customer.errors, :status => :unprocessable_entity
			end
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def update
		begin
			customer = current_session.user.client.customers.find(params[:id])
	
			if customer.update_attributes(params[:customer])
				output customer
			else
				render :json => customer.errors, :status => :unprocessable_entity
			end
	
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def destroy
		begin
			customer = current_session.user.client.customers.find(params[:id])
			customer.destroy
			head :no_content
	
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	private
	
	def customers_params
		params.require(:customer).permit(:name, :phone, :email, :notes)
	end  
end
