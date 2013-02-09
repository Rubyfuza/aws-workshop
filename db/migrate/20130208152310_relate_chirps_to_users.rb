class RelateChirpsToUsers < ActiveRecord::Migration
  def up
    add_column :chirps, :user_id, :integer
    remove_column :chirps, :user
  end

  def down
    # lol
  end
end
