class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references :user_id
      t.references :following_user

      t.timestamps
    end
    add_index :followings, :user_id
    add_index :followings, :following_user_id
  end
end
