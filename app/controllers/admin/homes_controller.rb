class Admin::HomesController < ApplicationController
  def top
    @menus = Menu.page(params[:page])
  end
end
