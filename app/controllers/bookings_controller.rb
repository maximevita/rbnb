class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_flat, only: [:new, :create]
  before_action :set_booking, only: [:show, :update, :edit]


  def index
    @bookings = current_user.bookings.all
  end

  def show
    @flat = Flat.find(@booking.flat)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.flat = @flat

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

private

  def booking_params
    params.require(:booking).permit(:begin_date, :end_date, :request_status, :review, :rating, :flat_id)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
