class UsersController < ApplicationController
	
	def fetch_all
		begin
			render :json => current_session.user.client.users.where("guest = 0")
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def fetch
		begin
			render :json => current_session.user.client.users.find(params[:id])
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	
	def fetch_guest
		begin
			session = current_session
			
			user = session.user.client.users.find_by_guest(true)
			
			if user == nil 
				user = session.user.client.users.new
				user.username = SecureRandom.uuid()
				user.password = ""
				user.guest = true
				user.save!
			end
			
			render :json => user
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	
	def destroy
		begin
			user = current_session.user.client.users.find(params[:id])
			user.destroy
			head :no_content
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def create
		begin
			user = current_session.user.client.users.new(users_params)
			
			if user.save
				render :json => user, :status => :created
			else
				render :json => user.errors, :status => :unprocessable_entity 
			end
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def update
		begin
			user = current_session.user.client.users.find(params[:id])
			
			if user.update_attributes(users_params)
				render :json => user
			else
				render :json => user.errors, :status => :unprocessable_entity
			end
			
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	private
	
	def users_params
		params.require(:user).permit(:username, :email, :password, :name, :client_id)
	end
end
