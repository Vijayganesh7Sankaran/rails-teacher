class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :quiz_name
      t.integer :category_id
      t.string :level
      t.integer :duration
      t.timestamps null: false
    end
     add_index :quizzes, :category_id
  end
end
