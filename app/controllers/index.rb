enable :sessions

get '/' do
  @posts = Post.all
  erb :index
end

get '/users/new' do
  erb :signup 
end

post '/users/new' do
  user = User.create(username: params[:username], password: params[:password])
  session[:user_id] = user.id
  redirect '/'
end


get '/users/:id' do |id|
  @user = User.find(id)
  erb :user
end

get '/users/:id/posts' do |id|
  @user = User.find(id)
  @posts = @user.posts
  erb :index
end

get '/users/:id/comments' do |id|
  @user = User.find(id)
  @comments = @user.comments
  erb :comments
end

get '/submit' do
  @user = User.find(session[:user_id])
  @errors = session.delete(:errors) if session[:errors]
  if @user
    erb :submit
  else
    # session[:intended_page] = "/submit"
    redirect '/login'
  end
end

post '/submit' do
  post = Post.new(user_id: session[:user_id], title: params[:title], url: params[:url])
  if post.valid?
    post.save
    redirect "/posts/#{post.id}"
  else
    session[:errors] = post.errors
    redirect '/submit'
  end
end

get '/login' do
  @errors = session.delete(:errors) if session[:errors]
  erb :login
end

post '/login' do
  user = User.find_by_username(params[:username]).try(:authenticate, params[:password])  
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    session[:errors] = "Invalid Login"
    redirect '/login'
  end
end

get '/posts/:post_id' do |post_id|
  @post = Post.find(post_id)
  @errors = session.delete(:errors) if session[:errors]
  erb :post
end

post '/posts/:post_id/comments/new' do |post_id|
  @user = User.find(session[:user_id])
  if @user
    comment = Comment.create(user_id: @user.id, post_id: post_id, body: params[:body])
    redirect "/posts/#{post_id}"
  else
    session[:errors] = "Please login to comment."
  end
end