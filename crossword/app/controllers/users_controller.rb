class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def login
    @user = User.find_by(username: params[:username])
    render json: @user
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :email, :password)
  end

end
