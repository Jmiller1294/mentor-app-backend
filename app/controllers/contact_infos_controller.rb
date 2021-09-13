class ContactInfosController < ApplicationController
  def index
    @contact_infos = ContactInfo.all
    render json: @contact_infos
  end

  def show
    @contact_info = ContactInfo.find_by(id: params[:id])
    render json: @contact_info
  end

  def create
    contact_info = ContactInfo.create(contact_params)
    render json: contact_info
  end

  def contact_params
    params.require(:contact_info).permit(:name, :email, :phone, :message)
  end
end
