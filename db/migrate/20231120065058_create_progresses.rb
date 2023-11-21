class CreateProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :progresses do |t|
      t.references :user, foreign_key: true
      t.references :lesson, foreign_key: true
      t.date :date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
