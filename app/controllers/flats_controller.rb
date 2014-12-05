class FlatsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :myflats]
  before_action :check_ownership, only: [:edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def search
    @flats = Flat.where("address LIKE ?", "%#{search_params[:address]}%").where("#{:capacity} >= #{search_params[:people]}")
    search_dates = {begin_date: search_params[:start], end_date: search_params[:end]}
    session[:search_dates] = search_dates
  end

  def myflats
    @flats = @user.flats
  end

  def show
  end

  def new
    @flat = @user.flats.new
  end

  def create
    @flat = @user.flats.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def check_ownership
    unless @flat.user == current_user
      flash[:notice] = "You are not the flat owner ! You can't edit it."
      render :show
    end
  end

  def set_user
    @user = current_user
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :address, :price_per_day, :capacity, :description, :housing_type)
  end

  def search_params
    params.permit(:address, :start, :end, :people)
  end
end

