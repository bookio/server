class AddOptionToSchedules < ActiveRecord::Migration
  def change
  	 remove_column :schedules, :rental_id
  	 add_column :schedules, :entity_id, :integer, {:null => false} 
  	 add_column :schedules, :entity, :string, {:null => false} 
  end
end
