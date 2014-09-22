class AnotherArray < ActiveRecord::Migration
  def change

	 add_column    :rentals, :xxx, :integer, {:array => true, :default => []}
	  
  end
end
