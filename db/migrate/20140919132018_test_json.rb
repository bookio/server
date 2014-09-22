class TestJson < ActiveRecord::Migration
  def change
	  add_column :rentals, :prefs, :json
  end
end
