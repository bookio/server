class AddStuffToCategory < ActiveRecord::Migration
  def change
	    
  	  remove_column :categories, :limit_availability
  	  remove_column :categories, :limit_from
  	  remove_column :categories, :limit_to
  	  change_column :categories, :name, :string, {:null => false, :default => ''}

	  change_column :categories, :available, :integer, {:null => false, :default => 1}
	  add_column    :categories, :automatic, :integer, {:null => false, :default => 0}
  end
end
