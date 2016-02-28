module TeamsHelper

  def team_member?(team_id)
    team = Team.get(team_id)
    team.users.map{ |user| user.id == current_user.id}.include?(true)
  end

end
