class AddStuffToRentals < ActiveRecord::Migration
  def change
  
  	  add_column :rentals, :latitude, :float, {:null => true}
  	  add_column :rentals, :longitude, :float, {:null => true}
  	  add_column :rentals, :location, :string, {:null => false, :default => ""}
  	  add_column :rentals, :seats, :integer, {:null => false, :default => 1}
  end
end
