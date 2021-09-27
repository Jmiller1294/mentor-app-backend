class EventRegistrationsController < ApplicationController
  def index 
    @event_registrations = EventRegistration.where(user_id: params[:user_id])
    render json: @event_registrations, include: [:event]
  end

  def show 
    @event_registration = EventRegistration.find_by(id: params[:id])
    render json: @event_registration
  end 

  def create
    user = User.find_by(id: params[:user_id])
    event_registration = user.event_registrations.build(
      image: params[:image],
      date: Time.now, 
      first_name: params[:first],
      last_name: params[:last],
      email: params[:email],
      phone_number: params[:phone],
      user_id: user.id, 
      event_id: params[:id])
    event_registration.save
    render json: event_registration
  end

  def destroy 
    event_registration = EventRegistration.find_by(id: params[:id])
    event_registration.destroy
  end
end

