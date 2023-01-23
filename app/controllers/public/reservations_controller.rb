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
      # 追加or質問
      NotificationMailer.welcome_email(@notification).deliver_later
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      flash[:success] = "予約を削除しました。"
      redirect_to my_page_path(current_customer.id)
    else
      render :show
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:customer_id, :day, :time, :start_time, :memo, :cancel, :status)
  end

  def notification_params
    params.require(:notification).permit(:reservation_id, :content, :email, :last_name)
  end

end
