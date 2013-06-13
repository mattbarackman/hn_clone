class User < ActiveRecord::Base
  
  has_secure_password

  has_many :posts
  has_many :comments
  has_many :comments_votes, :through => :comments
  has_many :posts_votes, :through => :posts
  # Remember to create a migration!
end
