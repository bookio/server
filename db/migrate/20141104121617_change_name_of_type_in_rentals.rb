class ChangeNameOfTypeInRentals < ActiveRecord::Migration
  def change
	 remove_column :rentals, :type
  	 add_column :rentals, :class, :string, { :null => false, :default => '' } 

  end
end
