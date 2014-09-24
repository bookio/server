class RentalsController < ApplicationController

	
	def fetch_all
		begin
			output current_session.user.client.rentals.all
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def generate
		begin
			
			index = 0
			count = params[:count].to_i()
			name  = params[:name]
			
			result  = []
			rentals = current_session.user.client.rentals
			
			ActiveRecord::Base.transaction do
				while index < count do
				
					rental = rentals.new()
					rental.name    = sprintf('%s %d', name, index + 1)
					rental.icon_id = 0
					rental.save
					
					index += 1

					result.push rental
				end
			
			end   	
			
			render :json => result
		rescue Exception => exception
			error exception.message, :not_found
		end
	
	end
 	
	
	def query
		begin
			session = current_session
			begin_at = DateTime.parse(params[:begin_at])
			end_at = DateTime.parse(params[:end_at])
			category_id = params[:category_id]
		
			reservations = session.user.client.reservations.overlaps(begin_at, end_at).select(:rental_id)
		
			unavailable = []
		
			reservations.each do |reservation|
				unavailable.push(reservation.rental_id)
			end       
		
			rentals = session.user.client.rentals
			rentals = rentals.where('available <> 0')
		
			if unavailable.count > 0
			  rentals = rentals.where("id not in (?)", unavailable)
			end
			
			if category_id != nil
			  rentals = rentals.where("category_id = ?", category_id)
			end
			
			output rentals.all
		
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	
	# Returns an array containing all existing categories
	
	def fetch
		begin
			output current_session.user.client.rentals.find(params[:id])
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def create
		begin
			session = current_session
			rental = session.user.client.rentals.new(rental_params)
	
			if params[:icon_id]
				rental.icon = Icon.find(params[:icon_id])
			else
				rental.icon = nil
			end
	
			if params[:category_id]
				rental.category = Category.find(params[:category_id])
			else
				rental.category = nil
			end
	
			if rental.save
				output rental
			else
				render :json => rental.errors, :status => :unprocessable_entity
			end
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def update
		begin
			rental = current_session.user.client.rentals.find(params[:id])
	
			if rental.update_attributes(rental_params)
				output rental
			else
				render :json => rental.errors, :status => :unprocessable_entity
			end
	
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def destroy
		begin
			rental = current_session.user.client.rentals.find(params[:id])
			rental.destroy
	
			head :no_content
		rescue Exception => exception
			error exception.message, :not_found
		end
	end

	
	private
	
	def rental_params
		params.require(:rental).permit! #(:description, :name, {:xxx => []}, :icon_id, :category_id, :depth, :available, :client_id, :data, {'options' => []}, :prefs => [{:a => []}, :b], :settings => [{:a => []}, :b])
	end

end
