class FixUp < ActiveRecord::Migration
  def change
	  remove_column :rentals, :options
	  remove_column :rentals, :prefs
	  remove_column :rentals, :xxx
	  remove_column :rentals, :settings
	  
	  add_column    :rentals, :option_ids, :integer, array: true, default: [] 



  end
end
