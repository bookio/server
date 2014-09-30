class FixAgain < ActiveRecord::Migration
  def change
  	 remove_column :rentals, :option_ids
  	 add_column :rentals, :option_ids, :integer, {:array => true, :default => []}
  end
end
