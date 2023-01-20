class Public::ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
    @menu = Menu.find(params[:menu_id])
  end

  def confirm
    @reservation = Reservation.find(params[:menu_id])
    @menu = Menu.find(params[:menu_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to menu_confirm_path(params[:menu_id])
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:customer_id, :day, :time, :start_time, :memo, :cancel, :status)
  end

end
