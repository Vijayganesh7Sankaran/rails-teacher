class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
     t.integer "user_id"
      t.string "name"
      t.integer "coins"
      t.integer "exp"
      t.integer "attack"
      t.integer "defence"
      t.integer "health"
      t.timestamps null: false
    end
    add_index :characters , :user_id
  end
end
