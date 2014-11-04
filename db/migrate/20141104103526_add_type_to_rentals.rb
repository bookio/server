class AddTypeToRentals < ActiveRecord::Migration
  def change
	 add_column :rentals, :type, :string, { :null => false, :default => '' } 
  end
end
