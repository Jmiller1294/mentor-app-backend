class BookingsController < ApplicationController
  require 'pry'
  def index
    @bookings = Booking.all
    render json: @bookings, include: [:mentor]
  end
 
  def create
    user = User.find_by(id: params[:user_id])
    @booking = user.bookings.build(date: "now", user_id: user.id, mentor_id: params[:id])
    @booking.save
    render json: @booking
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    render json: Mentor.find_by(id: @booking.mentor.id)
  end
end