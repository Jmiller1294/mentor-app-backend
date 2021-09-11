class EventRegistrationsController < ApplicationController
  def index 
    @event_registrations = EventRegistration.all
    render json: @event_registrations
  end

  def show 
    @event_registration = EventRegistration.find_by(id: params[:id])
    render json: @event_registration
  end 

  def destroy 
    event_registration = EventRegistration.find_by(id: params[:id])
    event_registration.destroy
  end

  def event_registration_params
    params.require(:event_registration).permit(:first_name,:last_name, :email, :phone)
  end
end

