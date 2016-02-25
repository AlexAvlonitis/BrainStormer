class Idea
  include DataMapper::Resource

  property :id,       Serial
  property :title,    String
  property :comment,  Text
  property :upvote,   Integer


  belongs_to :user

end
