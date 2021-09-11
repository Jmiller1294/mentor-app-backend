class RegistrationsController < ApplicationController
  
  def create
    @user = User.create(email: params["email"], 
      password: params["password"], 
      password_confirmation: params["password_confirmation"]
    )
    if @user
      session[:user_id] = @user.id
      render json: {
        status: created,
        user: @user,
        logged_in: true
      }
    else 
      render json {
        status: 500
      }
    end
  end

  def registration_params
    params.require(:registration).permit(:email, :password)
  end
end