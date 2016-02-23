class BrainStormer < Sinatra::Base

  get '/api/users/:id' do
    content_type :json

    user = User.get(params[:id])
    user.to_json
  end

  post '/api/users' do
    req = JSON.parse request.body.read

    user = User.create( fname: req["fname"],
                        lname: req["lname"],
                        email: req["email"],
                        password: req["password"],
                        password_confirmation: req["password_confirmation"])
    session[:user_id] = user.id
    if user.valid?
      status 201
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
