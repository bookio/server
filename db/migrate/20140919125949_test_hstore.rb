class TestHstore < ActiveRecord::Migration
  def change
  enable_extension :hstore
  
  add_column :rentals, :settings, :hstore
  
  end
end
