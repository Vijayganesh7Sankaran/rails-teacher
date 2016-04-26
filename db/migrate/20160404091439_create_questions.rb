class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer "quiz_id"
      t.string :question
      t.string :imgurl
      t.string :imgdesc
      t.integer :point
      t.timestamps null: false
    end
    add_index :questions, :quiz_id
  end
end
