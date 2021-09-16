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
    mentor = Mentor.find_by(id: params[:mentor_id])
    appointment = appointment.mentors.build(time: params[:time], day: params[:day], mentor: mentor)
    appointment.save
    render json: appointment
  end
end
