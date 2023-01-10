class Public::MenusController < ApplicationController
  def index
    @menus = Menu.page(params[:page])
  end

  def show
    @menus = Menu.find(params[:id])
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :introduction, :image, :price, :course)
  end

  def reservation_params
    params.require(:reservation).permit(:customer_id, :day, :time, :strat_time, :memo, :cancel, :status)
  end

end
