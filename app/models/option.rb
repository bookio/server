class Option < ActiveRecord::Base
	validates :client_id, :presence => true
	belongs_to :client
	
	
	before_destroy :cleanup
	
	
	def cleanup
		# UPDATE rentals SET option_ids = array_remove(option_ids, 5) WHERE 5 = ANY (option_ids);
		sql = ""
		sql << "UPDATE rentals SET option_ids = array_remove(option_ids, "
		sql << self.id.to_s
		sql << ") WHERE "
		sql << self.id.to_s
		sql << " = ANY (option_ids)";

		ActiveRecord::Base.connection.execute(sql)
	
	end

end
