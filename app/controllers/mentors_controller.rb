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
    @mentor = @user.mentors.build(params)
    @mentor.save
    render json: @mentor
  end
end
