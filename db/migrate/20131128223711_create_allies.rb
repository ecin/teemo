class CreateAllies < ActiveRecord::Migration
  def change
    create_table :allies do |t|
      t.integer :user_id, null: false
      t.integer :captain_id, null: false
      t.integer :activity_id, null: false
      t.timestamps
    end
  end
end
