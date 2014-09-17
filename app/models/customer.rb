class Customer < ActiveRecord::Base
  
  has_many :reservations, :dependent => :destroy

  validates_uniqueness_of :email, {:scope => :client_id, :allow_blank => true}
  
  belongs_to :client
  
	private

	def customer_params
		params.require(:customer).permit(:name, :phone, :email, :notes)
	end	
  
end
