class CreateAlarms < ActiveRecord::Migration[7.0]
  def change
    create_table :alarms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.datetime :alarm_time

      t.timestamps
    end
  end
end
