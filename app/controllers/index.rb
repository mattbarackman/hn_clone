enable :sessions

get '/' do
  # has list of all recent posts
  # has login button in upper right corner
  # login redirects you to a 

  erb :index
end

get '/users/new' do
  #sign up page
  erb :signup 
end

post '/users/new' do
  p "*" * 100
  user = User.create(username: params[:username], password: params[:password])
  session[:user_id] = user.id
  redirect '/'
end


get '/user/:id' do
  #list all posts
end


get '/submit' do
  # submit link in navigation
  # wTb3DLgHtmmtq9yLZTJMSr

  # has form to login
  # has form to create an account

  if @user
    erb :submit
  else
    # session[:intended_page] = "/submit"
    erb :login
  end
end

get '/login' do
  #login link in upper right corner

  #has form to login
  erb :login
end

get '/x' do
  # where we are directed to after logging in to create post data

end