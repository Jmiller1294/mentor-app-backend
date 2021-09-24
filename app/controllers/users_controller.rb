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
    user = User.create(
      name: params[:name], 
      email: params[:email].downcase, 
      password: params[:password]
    )
  end

  def get_favorites
    user = User.find_by(id: params[:user_id])
    fav_ids = user.favorite_ids
    render json: fav_ids
  end

  def add_favorite_id
    user = User.find_by(id: params[:user_id])
    user.favorite_ids << params[:id]
    user.favorite_ids = user.favorite_ids.uniq
    user.save!
    render json: user
  end

  def delete_favorite_id
    user = User.find_by(id: params[:user][:id])
    fav_id = params[:id]
    u = user.favorite_ids
    u.delete(fav_id.to_i)
    user.save!
    render json: user
  end
end
