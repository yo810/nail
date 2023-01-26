class Admin::ReservationsController < ApplicationController
  def index
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @reservation = @customer.reservations.page(params[:page]).reverse_reservation
    elsif params[:created_at] == "today"
      @reservations = Reservation.reservationed_today.includes(:customer).page(params[:page]).reverse_reservation
    else
      @reservations = Reservation.includes(:customer).page(params[:page])
    end
    @menu = Menu.find(params[:menu_id])
  end

  def show
    # 途中
    @reservations = @includes(:menu)
    @customer = @reservation.customer
  end

  def reservation_params
    params.require(:reservation).permit(:customer_id, :day, :time, :start_time, :memo, :cancel, :status, :menu_id)
  end
end
