class BrainStormer < Sinatra::Base

  post '/api/users' do
    req = JSON.parse(request.body.read)

    user = User.create( fname: req["fname"],
                        lname: req["lname"],
                        email: req["email"],
                        password: req["password"],
                        password_confirmation: req["password_confirmation"])
    if user.valid?
      status 201
      user.to_json
    else
      status 500
    end
  end



end
