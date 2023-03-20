class Public::ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
    @menu = Menu.find(params[:menu_id])
  end

  def confirm
    #下記 params[:menu_id] → params[:id]に変更
    @reservation = Reservation.find(params[:id])
    @menu = Menu.find(params[:menu_id])
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    @reservation.menu_id = @menu.id
    if @reservation.save
      @notification = Notification.new
      @notification.reservation_id = @reservation.id
      NotificationMailer.welcome_email(@reservation).deliver_later
      redirect_to menu_confirm_path(params[:menu_id], @reservation.id)
      #上記 @reservation.id追加
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
