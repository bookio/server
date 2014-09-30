class FixNullInRentals < ActiveRecord::Migration
  def change
  
  	 change_column :rentals, :option_ids, :integer, {:array => true, :default => [], :null => false}
  	 change_column :rentals, :description, :text, {:default => '', :null => false}
  	 change_column :rentals, :name, :string, {:default => '', :null => false}

  end
end
