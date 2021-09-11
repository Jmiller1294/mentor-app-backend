class EventsController < ApplicationController
  def index
    @events = Event.all
    render json: @events
  end

  def show
    @event = Event.find_by(id: params[:id])
    render json: @event
  end

  def create
    event = Event.create(event_params)
    render json: event
  end

  def event_params
    params.require(:event).permit(:name, :date, :time, :description, :location, :likes)
  end
end
