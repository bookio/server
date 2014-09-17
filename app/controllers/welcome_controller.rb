class WelcomeController < ApplicationController

	def hello
		foo = {:kalle => 2}
		
		output foo
		
		rescue Exception => exception
			error exception.message, :not_found
		end	
	end
	
end
