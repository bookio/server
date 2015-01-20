class Rental < ActiveRecord::Base
	
	validates :client_id, :presence => true
	serialize :data
	
	has_many :reservations, :dependent => :destroy
	#has_many :options, :dependent => :destroy
	
	#has_many :schedules, :dependent => :destroy
	
	before_destroy :cleanup
	
	
	#def schedule
	#	session.user.client.schedules.new(schedule_params)
	#end
	
	def cleanup
		Schedule.delete_all(["entity = 'rental' AND entity_id = ?", self.id])
	end
	
	
	belongs_to :client
	belongs_to :icon
	belongs_to :category
	


end
