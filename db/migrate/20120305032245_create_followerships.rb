class CreateFollowerships < ActiveRecord::Migration
  def change
    create_table :followerships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    # Add some indices.
    # TODO: Are these sufficient?
    add_index :followerships, :follower_id
    add_index :followerships, :followed_id
    add_index :followerships, [:follower_id, :followed_id], :unique => true
  end
end
