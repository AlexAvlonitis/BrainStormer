class BrainStormer < Sinatra::Base

  get '/api/users/:id' do
    content_type :json

    user = User.get(params[:id])
    user.to_json
  end

  post '/api/users' do
    params = JSON.parse request.body.read

    user = User.create( fname: params["fname"],
                        lname: params["lname"],
                        email: params["email"],
                        password: params["password"],
                        password_confirmation: params["password_confirmation"])

    if user.valid?
      session[:user_id] = user.id
      status 201
      user.to_json
    else
      status 500
    end
  end

  put '/api/users/:id' do
    req = JSON.parse request.body.read

    user = User.get(params[:id])
    status 404 if t.nil?
    status 500 unless user.update(
                        fname: req["fname"],
                        lname: req["lname"],
                        email: req["email"],
                        )
  end

end
