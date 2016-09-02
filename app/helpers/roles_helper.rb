module RolesHelper
  def user_admin?
    current_user.role.name == "Admin"
  end

  def params_depend_on_user(name)
    if current_user
      react_component name, { data: @teams, user_id: current_user.id }
    else
      react_component name, { data: @teams, user_id: 0 }
    end
  end
end
