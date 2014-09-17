class Option < ActiveRecord::Base
 # attr_accessible :description, :name, :rental_id, :client_id
  
  validates :rental_id, :presence => true
  validates :client_id, :presence => true


  belongs_to :rental  
  belongs_to :client
  
  
end
