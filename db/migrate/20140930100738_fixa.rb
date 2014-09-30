class Fixa < ActiveRecord::Migration
  def change
  	 change_column :rentals, :option_ids, :integer, {:array => true, :default => []}

  end
end
