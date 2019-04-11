class UsersController < ApplicationController

  def login
    @user = User.find_by(username: params[:username])
    render json: @user
  end

end
