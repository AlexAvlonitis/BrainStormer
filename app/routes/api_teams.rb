class BrainStormer < Sinatra::Base

  get '/api/teams' do
    content_type :json

    teams = Team.all

    teams.to_json
  end

  post '/api/teams' do
    params = JSON.parse request.body.read

    team = Team.create(name: params["name"])
    team.users << current_user
    team.save!

    if team.valid?
      status 201
      team.to_json
    else
      status 500
    end
  end

end
