class MentorsController < ApplicationController
  require 'pry'
  def index
    @mentors = Mentor.all
    render json: @mentors
  end

  def show
    @mentor = Mentor.find_by(id: params[:id])
    render json: @mentor
  end

  def create
    @mentor = Mentor.create(
      name: params[:name], 
      title: params[:title], 
      avatar: params[:avatar],
      city: params[:city], 
      email: params[:email],
      age: params[:age],
    )
    render json: @mentor
  end
end
