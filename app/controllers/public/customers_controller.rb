class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def widhdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :email)
  end

end
