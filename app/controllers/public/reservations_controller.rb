class Public::ReservationsController < ApplicationController
  def new
  end

  def confirm
  end

  private

  def reservation_params
    params.require(:reservation).permit(:customer_id, :day, :time, :strat_time, :memo, :cancel, :status)
  end

end
