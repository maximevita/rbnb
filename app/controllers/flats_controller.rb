class FlatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flat, only: [:show]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :price_per_day, :capacity, :description, :housing_type)
  end
end

