class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer "user_id"
      t.integer "tot_points"
      t.integer "correct_ans"
      t.integer "wrong_ans"
      t.integer "attempt_quiz"
      t.timestamps null: false
    end
    add_index :profiles , :user_id, unique:true
  end
end
