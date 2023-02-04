class Admin::MenusController < ApplicationController

  def index
    @menus = Menu.page(params[:page])
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
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
       redirect_to admin_menu_path(@menu.id)
    else
       render :edit
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :introduction, :image, :price, :course)
  end

end
