class CreateCommentVotes < ActiveRecord::Migration
  def change

    create_table :comments_votes, :id => false do |t|
      t.references :comment
      t.references :user
      t.integer :vote
    end 

  add_index :comments_votes, [:comment_id, :user_id], :unique => true

  end

end
