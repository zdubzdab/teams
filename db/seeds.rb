["Admin", "Team lead", "Teammate"].each do |role|
  Role.find_or_create_by(name: role)
end

User.create_with(name: 'User_admin', password: 'password', role_id: 1).find_or_create_by(email: 'admin@gmail.com')

User.create_with(name: 'User_team_lead', password: 'password', role_id: 2).find_or_create_by(email: 'team_lead@gmail.com')

10.times do |n|
  name  = "User_teammate#{n+1}"
  email = "teammate#{n+1}@gmail.com"
  password  = "password"
  role_id = 3
  User.create_with(name: name,
                   role_id: role_id,
                   password: password,
                   password_confirmation: password).find_or_create_by(email: email)
end
