class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.integer :ubadge_id
      t.integer "user_id"
      t.timestamps null: false
    end
    add_index :badges , ["user_id","ubadge_id"], :name => 'my_index1'
  end
end
