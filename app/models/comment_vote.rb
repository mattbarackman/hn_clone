class CommentsVote < ActiveRecord::Base
  belongs_to :comment 
  belong_to :user
end
