class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :lesson, null:false, foreign_key: true
      t.text :content, null: false
      t.text :explanation
      t.boolean :answer, null: false
      t.timestamps
    end
  end
end
