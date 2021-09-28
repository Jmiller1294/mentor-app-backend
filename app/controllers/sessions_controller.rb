class SessionsController < ApplicationController
  include CurrentUserConcern
  def create
    @user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
    if @user
      if @user.avatar.filename != nil
        avatar = rails_blob_path(@user.avatar)
      else 
        avatar = nil;
      end
      session[:user_id] = @user.id 
      render json: {
        status: :created,
        logged_in: true,
        user: { user: @user, avatar: avatar }
      }
    else 
      render json: {
        logged_in: false,
        user: nil
      }
    end
  end

  def logged_in
    if @current_user
      render json: {
        status: :created,
        logged_in: true,
        user: @current_user
      }
    else 
      flash[:message] = 'Invalid username/password combination'
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {
      status: 200,
      logged_in: false
    }
  end
end