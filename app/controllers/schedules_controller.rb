class SchedulesController < ApplicationController


	
	def fetch_all
		begin
			output current_session.user.client.schedules.all
		rescue Exception => exception
			error exception.message, :not_found
		end
	end


	
	
	
	def fetch
		begin
			output current_session.user.client.schedules.find(params[:id])
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def create
		begin
			session = current_session
			schedule = session.user.client.schedules.new(schedule_params)

			if schedule.save
				output schedule
			else
				render :json => schedule.errors, :status => :unprocessable_entity
			end
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def update
		begin
			schedule = current_session.user.client.schedules.find(params[:id])

			if schedule.update_attributes(schedule_params)
				output schedule
			else
				render :json => schedule.errors
			end
	
		rescue Exception => exception
			error exception.message, :not_found
		end
	end
	
	def destroy
		begin
			schedule = current_session.user.client.schedules.find(params[:id])
			schedule.destroy
	
			head :no_content
		rescue Exception => exception
			error exception.message, :not_found
		end
	end

	
	private
	
	def schedule_params
		params.require(:schedule).permit!
	end


end
