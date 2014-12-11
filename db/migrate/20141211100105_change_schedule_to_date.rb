class ChangeScheduleToDate < ActiveRecord::Migration
  def change


	 remove_column :schedules, :begin_at
	 remove_column :schedules, :end_at
	 remove_column :schedules, :weekday
	 
  	 add_column :schedules, :begin_at, :datetime, { :null => false } 
  	 add_column :schedules, :end_at, :datetime, { :null => false } 


  end
end
