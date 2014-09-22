class Kalle < ActiveRecord::Migration
  def change
	  remove_column :rentals, :options
	  add_column    :rentals, 'options', :integer, array: true, default: [] 

  end
end
