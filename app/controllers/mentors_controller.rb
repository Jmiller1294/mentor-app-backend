class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
    render json: @mentors
  end

  def show
    @mentor = Mentor.find_by(id: params[:id])
    render json: @mentor
  end

  def create
    mentor = Mentor.create(mentor_params)
    render json: mentor
  end

  def mentor_params
    params.require(:mentor).permit(:name, :title, :avatar, :city, :email, :age)
  end
end
