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
                        user_id:      current_user.id )

    if idea.valid?
      status 201
      idea.to_json
    else
      status 500
    end
  end

  put '/api/ideas/:id' do
    req = JSON.parse request.body.read

    idea = Idea.get(params[:id])
    status 404 if t.nil?
    status 500 unless user.update(title:        params["title"],
                                  description:  params["description"],
                                  upvote:       params["upvote"])
  end

  delete '/api/ideas/:id' do
    idea = Idea.get(params[:id])
    if idea.nil?
      status 404
    end
    status 500 unless idea.destroy
  end

end
