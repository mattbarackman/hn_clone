class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :posts_votes

  validates_presence_of :url
  validates_presence_of :title
end
