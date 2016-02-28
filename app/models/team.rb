class Team
  include DataMapper::Resource

  property :id,           Serial
  property :title,        String
  property :description,  Text

  has n, :users, through: Resource
  has n, :ideas

end
