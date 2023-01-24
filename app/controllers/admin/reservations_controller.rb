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
    @reservations = @includes(:menu)
    @customer = @reservation.customer
  end
end
