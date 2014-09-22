class FixUpAgain < ActiveRecord::Migration
  def change
	  remove_column :options, :rental_id


  end
end
