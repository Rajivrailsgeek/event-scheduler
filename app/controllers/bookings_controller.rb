class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy]

  #/bookings
  def index
    @bookings = Booking.all
    @bookings = Booking.paginate(page: params[:page], per_page: 10)
    @bookings = @bookings.paginate(page: params[:page], per_page: 10).order(created_at: :desc)

  end

  #/bookings
  def new
    @booking = Booking.new
  end

  #/bookings
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new
    end
  end
  
  #/bookings/:id
  def show
  end

  #/bookings/:id
  def edit
  end

  #/bookings/:id
  def update
    if @booking.update(booking_params)
      redirect_to bookings_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #/bookings/:id
  def destroy
    @booking.destroy
    redirect_to bookings_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :booking_date, :billing_address)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
