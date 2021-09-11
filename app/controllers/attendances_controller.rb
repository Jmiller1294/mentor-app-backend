class AttendancesController < ApplicationController

  def index
    @attendances = Attendance.all
    render json: @attendances, include: [:event]
  end
 
  def show
    @attendance = Attendance.find_by(id: params[:id])
    render json: @attendance
  end

  def create
    user = User.find_by(id: params[:user_id])
    attendance = user.attendances.build(date: Time.now, 
      user_id: user.id, 
      event_id: params[:id])
    attendance.save
    render json: @attendance
  end

  def destroy
    attendance = Attendance.find_by(event_id: params[:id])
    attendance.destroy
  end
  
end

