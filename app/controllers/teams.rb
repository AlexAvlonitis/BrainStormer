class BrainStormer < Sinatra::Base

  get '/teams/:id' do
    logged_in?
    response_team = RestClient.get 'http://localhost:9292/api/teams/' + params[:id]
    response_team_users = RestClient.get 'http://localhost:9292/api/teams/' + params[:id] + '/users'
    response_ideas = RestClient.get 'http://localhost:9292/api/ideas'
    response_users = RestClient.get 'http://localhost:9292/api/users'

    team = JSON.parse(response_team)
    @ideas = JSON.parse(response_ideas)
    @team_users = JSON.parse(response_team_users)
    @users = JSON.parse(response_users)

    @team_id = team["id"]
    @team_title = team["title"]
    @team_description = team["description"]
    haml :team
  end

end
