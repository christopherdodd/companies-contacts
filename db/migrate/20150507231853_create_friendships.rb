class CreateFriendships < ActiveRecord::Migration
  def up
    create_table :friendships do |t|
      t.integer :contact_id
      t.integer :friend_id

      t.timestamps null: false
    end
  end

  def down
    drop_table :friendships
  end
end
