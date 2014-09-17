class Icon < ActiveRecord::Base

  has_many :rentals, :dependent => :destroy
    
end
