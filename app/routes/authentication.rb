class BrainStormer < Sinatra::Base

  post '/login' do
    user = User.first(email: params[:email])
    success = user.login(params[:password]) if user
    if success
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/register'
    end
  end

end
