5.times do 
  name = "#{Faker::Name.first_name}#{Faker::Name.last_name}"
  User.create(username: name,
              email: Faker::Internet.email(name),
              password: "password",
              password_confirmation: "password")
end

20.times do
  user = User.all.sample
  
  post = Post.create(title: Faker::Company.bs,
                     body: Faker::Lorem.sentences(5),
                     url: "http://mattbarackman.com")
  user.posts << post
  user.save
end

posts = Post.all
posts.each do |post|
  users = User.all.shuffle[0...3]
   users.each do |user|
    post.posts_votes << PostsVote.create(user_id: user.id, 
                                         post_id: post.id,
                                         vote: 1)
    post.save
  user.save
  end
end

40.times do
  post = Post.all.sample
  post.comments << Comment.create(body: Faker::Lorem.sentences(5), user_id: User.all.sample.id)
  post.save
end

comments = Comment.all
comments.each do |comment|
  users = User.all.shuffle[0...3]
   users.each do |user|
    comment.comments_votes << CommentsVote.create(user_id: user.id, 
                                                  comment_id: comment.id,
                                                  vote: 1)
    comment.save
  user.save
  end
end