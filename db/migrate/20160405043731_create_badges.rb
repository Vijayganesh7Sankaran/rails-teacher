class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string "badge_name"
      t.integer "user_id"
      t.timestamps null: false
    end
    add_index :badges , :user_id
  end
end
