class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.references :course, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.text :tips
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
