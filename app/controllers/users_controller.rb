class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show 
    @user = User.find_by(id: params[:id])
    render json: @user, include: [:bookings, :attendances]
  end

  def create
    user = User.new(user_params)
    user.save
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
