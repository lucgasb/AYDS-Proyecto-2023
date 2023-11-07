class UsersController < Sinatra::Base

  set :views, File.expand_path('../views', __dir__)
  
  get '/' do
    erb :index
  end

  post '/' do
    user = User.find_by(username: params[:username], password: params[:password])
    if !user.nil?
      session[:user_id] = user.id.to_s
      @user = User.find_by(id: session[:user_id])
      erb :index2
    else
      redirect '/register'
    end
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    if params[:password] == params[:password2]
      user = User.create(username: params[:username], email: params[:email], password: params[:password])
      redirect '/'
    else
      redirect '/register'
    end
  end

end