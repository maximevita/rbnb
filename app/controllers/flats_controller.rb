class FlatsController < ApplicationController
  before_action :authenticate_user!
  efore_action :set_flat, only: [:show]

  def index
    @flats = Flat.all
  end

  def show
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
