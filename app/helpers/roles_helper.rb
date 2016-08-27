module RolesHelper
  def user_admin?
    current_user.role.name == "Admin"
  end
end
