class RecreateHstore < ActiveRecord::Migration
  def change
	  remove_column :rentals, :settings
  add_column :rentals, :settings, :hstore, :default => {}


  end
end
