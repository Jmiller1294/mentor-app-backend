class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    render json: @appointments, include: [:mentor]
  end

  def show 
    @appointment = Appointment.find_by(id: params[:id])
    render json: @appointment, include: [:mentor]
  end

  def create
    mentor = Mentor.find_by(id: params[:mentor][:id])
    user = User.find_by(id: params[:id])
    appointment = user.appointments.build(time: params[:time], day: params[:day], mentor: mentor)
    appointment.save
    render json: appointment
  end

  def update

  end

  def destroy 
    appointment = Appointment.find_by(id: params[:id])
    appointment.destroy
    render json: appointment
  end
end
