class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer "question_id"
      t.string "option"
      t.boolean "correct"
      t.timestamps null: false
    end
    add_index :options, :question_id
  end
end
