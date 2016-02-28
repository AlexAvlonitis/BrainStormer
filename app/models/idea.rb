class Idea
  include DataMapper::Resource

  property :id,           Serial
  property :title,        String
  property :description,  Text
  property :upvote,       Integer

  belongs_to :user
  belongs_to :team

  def increase_upvote
    self.upvote += 1
    self.save!
  end

end
