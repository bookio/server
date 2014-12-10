class Rental < ActiveRecord::Base
	
	validates :client_id, :presence => true
	serialize :data
	
	has_many :reservations, :dependent => :destroy
	#has_many :options, :dependent => :destroy
	
	has_many :schedules, :dependent => :destroy
	
	
	belongs_to :client
	belongs_to :icon
	belongs_to :category
	


end
