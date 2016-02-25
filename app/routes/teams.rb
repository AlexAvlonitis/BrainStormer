class BrainStormer < Sinatra::Base


  get '/teams/:id' do
    response = RestClient.get 'http://localhost:9292/api/teams/' + params[:id]
    params = JSON.parse(response)
    p params

    @team_title = params["title"]
    @team_description = params["description"]
    haml :team
  end

end
