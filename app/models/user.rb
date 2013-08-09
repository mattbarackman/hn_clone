class User < ActiveRecord::Base
  
  has_secure_password

  has_many :posts
  has_many :comments
  has_many :comments_votes, :through => :comments
  has_many :posts_votes, :through => :posts

  def total_karma
    comment_karma + post_karma
  end

  def comment_karma
    comments_votes.inject(0){|sum, vote| sum += vote.vote}
  end

  def post_karma
    posts_votes.inject(0){|sum, vote| sum += vote.vote}
  end

end
