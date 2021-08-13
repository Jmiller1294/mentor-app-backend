class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    render json: @bookings, include: [:mentor]
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    render json: @booking
  end

  def create
    user = User.find_by(id: params[:user_id])
    booking = user.bookings.build(date: Time.now, 
      user_id: user.id, 
      mentor_id: params[:id])
    booking.save
    render json: booking
  end
end