class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show 
    @user = User.find_by(id: params[:id])
    render json: @user, include: [:bookings, :event_registrations, :appointments]
  end

  def create
    user = User.new(params)
    user.save
  end

  private

  def add_favorite_id
    user = User.find_by(id: params[:user_id])
    user.favorite_ids << params[:id]
    user.favorite_ids = user.favorite_ids.uniq
    user.save!
    render json: user
  end

  def delete_favorite_id
    binding.pry
  end
end
