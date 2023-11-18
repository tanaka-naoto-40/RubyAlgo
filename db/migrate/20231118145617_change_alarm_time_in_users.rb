class ChangeAlarmTimeInUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :alarm_time, :time
  end

  def down
    change_column :users, :alarm_time, :datetime
  end
end
