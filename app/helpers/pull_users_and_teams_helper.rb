module PullUsersAndTeamsHelper
  def pull_users_their_roles_and_teams_belongs_to_team_users(team_users, users)
    users_json = team_users.map do |t_u|
        {
            id: t_u.user.id,
            name: t_u.user.name,
            email: t_u.user.email,
            role: t_u.user.role.name,
            team_id: t_u.team_id,
            team_name: t_u.team.name,
            team_user_id: t_u.id 
        } 

    end
    react_component 'TeamUsers', {team_users: users_json, users: users}
  end
end
