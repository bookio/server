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
	
	
	
	
	
	def update_schedule
		begin
			result = []			
			
			id = params[:id]
			
			#foo = ActiveSupport::JSON.decode(request.body.to_s)
			
			if (params.has_key?('A')) 
				items = params['A']
				puts items.length
				items.each do |item|
					result.push(:start => item['start'], :end => item['end'])
				end
				
			end
			

			output result			
			
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def fetch_schedule
		begin
			schedules = current_session.user.client.schedules.where(:entity => 'option', :entity_id => params[:id])

			result = {}
      
			schedules.each do |schedule|
				if !result.has_key?(schedule.tag)
					result[schedule.tag] = []	  	
				end				
				
				array = result[schedule.tag]
				array.push(:start => schedule.begin_at, :end => schedule.end_at)
			end

			output result			
			
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
	  params.require(:option).permit!
	
	end
	

end
