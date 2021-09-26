class EventsController < ApplicationController
  def index
    events = Event.all
    render json: events, include: [:image]
  end

  def show
    event = Event.find_by(id: params[:id])
    image = rails_blob_path(event.image)
    render json: { event: event, image: image }
  end

  def update
    event = Event.find_by(id: params[:id])
    event.update_attribute(:likes, params[:likes])
    render json: event
  end

  def create
    event = Event.create(event_params)
    render json: event
  end

  def event_params
    params.require(:event).permit(:name, :date, :time, :description, :location, :likes, :image)
  end
end
