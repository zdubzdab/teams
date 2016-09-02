class TeamUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :access_validation!
  
  def index
    @users = User.all
    @team_users = TeamUser.includes(:team, user: [:role]).where(team_id: params[:team_id])
  end

  def create
    @team_user = TeamUser.new(team_user_params)

    if @team_user.save
      render json: @user
    else
      render json: @team_user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @team_user = TeamUser.find(params[:id])
    @team_user.destroy
    head :no_content
  end

  private

    def team_users_params
      params.require(:team_users).permit(:team_id, :user_id, :role_id)
    end

    def authenticate_user!
      redirect_to root_path unless user_signed_in?
    end

    def access_validation!
      redirect_to root_path unless current_user.role.name == "Admin"
    end
end
