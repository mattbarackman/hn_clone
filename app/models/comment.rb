class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comments_votes
  # Remember to create a migration!
end
