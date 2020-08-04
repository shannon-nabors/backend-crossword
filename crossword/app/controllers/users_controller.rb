class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    render json: @user.as_json(except: :password_digest)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :email, :password)
  end

end
