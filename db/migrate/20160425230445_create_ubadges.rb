class CreateUbadges < ActiveRecord::Migration
  def change
    create_table :ubadges do |t|
      t.string "badge_name"
      t.string "url"
      t.timestamps null: false
    end
  end
end
