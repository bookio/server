class AddStuffToOptions < ActiveRecord::Migration
  def change
  	 add_column :options, :units, :integer, {:null => false, :default => 0} 
  	 add_column :options, :unit, :string, {:null => false, :default => ''} 
  	 add_column :options, :selection, :integer, {:null => false, :default => 0} 
  end
end
