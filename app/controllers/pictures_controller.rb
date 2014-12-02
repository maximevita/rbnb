class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flat, only: [:create, :new]

  def new
    @picture = @flat.pictures.new
  end

  def create
    @picture = @flat.pictures.new(picture_params)
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
