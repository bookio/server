class ReservationsController < ApplicationController
  
	def fetch_all
		begin
			render :json => current_session.user.client.reservations.all
		rescue Exception => exception
			error exception.message, :not_found
		end
	end

	def fetch
		begin
			render :json => current_session.user.client.reservations.find(params[:id])
		rescue Exception => exception
			error exception.message, :not_found
		end
	end

	def create
		begin
			reservation = current_session.user.client.reservations.new(reservations_params)
	
			if reservation.save
				render :json => reservation, :status => :created
			else
				render :json => reservation.errors, :status => :unprocessable_entity
			end
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
  
	
	def update
		begin
			reservation = current_session.user.client.reservations.find(params[:id])
		
			if reservation.update_attributes(reservations_params)
				render :json => reservation
			else
				render :json => reservation.errors, :status => :unprocessable_entity
			end
		
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def destroy
		begin
			customer = current_session.user.client.reservations.find(params[:id])
			customer.destroy
			head :no_content
			
		rescue Exception => exception
			error exception.message, :not_found
		end
	end  

  def bookings
    begin
      session = current_session
      reservations = session.user.client.reservations.all

      json = []
      customers = {}
      rentals = {}
      
	  reservations.each do |reservation|
	    if !rentals.has_key?(reservation.rental_id)
          rentals[reservation.rental_id] = []	  	
		end
		reservations_for_rental = rentals[reservation.rental_id]
		reservations_for_rental.push(reservation)
		
		customers[reservation.customer_id] = reservation.customer
	  end
	  
	  json = {:customers => customers, "JJJ" => rentals}
      
      render :json => json
    rescue Exception => exception
    	error exception.message, :not_found
    end
  end


  def foo
    begin
    
      session = current_session

	  reservations = session.user.client.reservations
	  
      result = {}

	  reservations.each do |reservation|
		result[reservation.id] = reservation;	  	
	  end

      render :json => result
	    
    rescue Exception => exception
      error exception.message, :not_found
    end
  end  




	private
	
	def reservations_params
		params.require(:reservation).permit(:customer, :end_at, :rental, :begin_at, :state, :client_id, :payed, :delivered, :transferred, :arrived, :price, :rental_id, :customer_id)
	end
	
end
