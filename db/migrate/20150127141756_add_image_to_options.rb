class AddImageToOptions < ActiveRecord::Migration
  def change

  	 add_column :options, :image, :text, {:null => false, :default => ''} 

  end
end
