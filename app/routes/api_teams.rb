class BrainStormer < Sinatra::Base

  get '/api/teams' do
    content_type :json

    teams = Team.all

    teams.to_json
  end

  post '/api/teams' do
    params = JSON.parse request.body.read

    team = Team.create(name: params["name"])
    team.users << team
    team.save

    if team.valid?
      status 201
      team.to_json
    else
      status 500
    end
  end

  put '/api/teams/:id' do
    req = JSON.parse request.body.read

    team = Team.get(params[:id])
    status 404 if t.nil?
    status 500 unless team.update(
                        fname: req["fname"],
                        lname: req["lname"],
                        email: req["email"],
                        )
  end


  delete '/api/teams/:id' do
    team = Team.get(params[:id])
    if team.nil?
      status 404
    end
    status 500 unless team.destroy
  end

end
