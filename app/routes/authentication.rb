class BrainStormer < Sinatra::Base

  post '/login' do
    params = JSON.parse request.body.read

    user = User.first(email: params["email"])
    success = user.login(params["password"]) if user

    if success
      session[:user_id] = user.id
      status 201
      user.to_json
    else
      status 500
    end

  end

  get '/register' do
    haml :register
  end

  delete '/logout' do
    session.clear
    s = status 201
    s.to_json
  end

end
