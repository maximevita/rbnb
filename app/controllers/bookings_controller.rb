class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @bookings = Booking.all
  end

  def show
    set_booking
  end

  def new
    set_flat
    @booking = Booking.new

  end

  def create
    set_flat
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    set_booking
  end

  def update
    set_booking
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
