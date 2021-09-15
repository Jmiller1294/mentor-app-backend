class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    render json: @appointments
  end

  def show 
    @appointment = Appointment.find_by(id: params[:id])
    render json: @appointment
  end

  def create
    appointment = Appointment.create(appointment_params)
    render json: appointment
  end

  def appointment_params
    params.require(:appointment).permit(:time, :day)
  end
end
