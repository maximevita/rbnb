class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flat, only: [:create]

  def new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def picture_params
    params.require(:picture).permit(:flat_image)
  end
end
