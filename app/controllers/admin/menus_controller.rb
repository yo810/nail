class Admin::MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save ? (redirect_to admin_menus_path(@menu)) : (render :new)
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :introduction, :image, :price, :course)
  end

end
