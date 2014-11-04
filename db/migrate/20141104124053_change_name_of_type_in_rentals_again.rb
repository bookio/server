class ChangeNameOfTypeInRentalsAgain < ActiveRecord::Migration
  def change
	 remove_column :rentals, :class
  	 add_column :rentals, :style, :string, { :null => false, :default => '' } 
  end
end
