User.seed do |s|
  s.id                    = 1
  s.name                  = "Marjan"
  s.email                 = "admin@example.com"
  s.password              = "12345678"
  s.password_confirmation = "12345678"
  s.role_id               = 1
  s.admin                 = true
end
User.create_with(name: 'admin', password: 'password').find_or_create_by(email: 'admin@gmail.com')


[:admin, :teammate, :team_lead].each do |role|
  Role.find_or_create_by(name: role)
end
