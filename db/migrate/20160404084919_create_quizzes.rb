class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :quiz_name
      t.string :category_name
      t.time :duration
      t.timestamps null: false
    end
  end
end
