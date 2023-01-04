class Public::MenusController < ApplicationController
  def index
    @menus = Menu.page(params[:page])
  end

  def show
    @menus = Menu.find(params[:id])
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :introduction, :image, :price, :course)
  end

end
