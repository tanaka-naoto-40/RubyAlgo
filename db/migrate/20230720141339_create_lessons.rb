class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.text :hints
      t.text :starter_code
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
