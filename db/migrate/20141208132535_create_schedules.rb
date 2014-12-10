class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :client, index: true
      t.references :rental, index: true
      t.time :begin_at
      t.time :end_at
      t.integer :weekday
      t.string :tag

      t.timestamps
    end
  end
end
