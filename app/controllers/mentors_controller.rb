class MentorsController < ApplicationController
  def index
    @mentors = Mentors.all
    render json: @mentors
  end

  def show
    @mentor = Mentor.find_by(id: params[:id])
    render json: @mentor
  end
end
