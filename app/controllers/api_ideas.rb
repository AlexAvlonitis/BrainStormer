class BrainStormer < Sinatra::Base

  get '/api/ideas' do
    content_type :json
    ideas = Idea.all
    ideas.to_json
  end

  post '/api/ideas' do
    params = JSON.parse request.body.read

    idea = Idea.create( title:        params["title"],
                        description:  params["description"],
                        user_id:      current_user.id,
                        team_id:      params["id"],
                        upvote:       0)

    if idea.valid?
      status 201
      idea.to_json
    else
      status 500
    end
  end

  put '/api/ideas/:id' do
    req = JSON.parse request.body.read
    idea = Idea.get(params["id"])

    if idea.increase_upvote
      status 201
      idea.to_json
    elsif idea.nil?
      status 404
    else
      status 500
    end

  end

  delete '/api/ideas/:id' do
    idea = Idea.get(params[:id])
    status 404 if idea.nil?
    status 500 unless idea.destroy
  end

end
