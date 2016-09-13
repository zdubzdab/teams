class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :access_validation!
  
  def index
    @users = User.all
    @roles = Role.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :role_id, :password)
    end

end
