class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer "user_id" 
      t.integer "quiz_id"
      t.integer "question_id"
      t.integer "option_id"
      t.timestamps null: false
    end
    add_index :histories , ["user_id","quiz_id","question_id","option_id"], :name => 'my_index'
  end
end
