class CreatePostVotes < ActiveRecord::Migration
  def change

    create_table :posts_votes, :id => false do |t|
      t.references :post
      t.references :user
      t.integer :vote
    end 

    add_index :posts_votes, [:post_id, :user_id], :unique => true

  end

end
