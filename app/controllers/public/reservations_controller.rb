class Public::ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
  end

  def confirm
    @reservation = Reservation.find(params[:id])
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path @reservation.id
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:customer_id, :day, :time, :strat_time, :memo, :cancel, :status)
  end

end
