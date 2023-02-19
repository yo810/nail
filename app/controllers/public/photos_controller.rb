class Public::PhotosController < ApplicationController
  def index
    @photos = Photo.page(params[:id]).per(16)
  end

  def show
    @photos = Photo.find(params[:id])
  end
end
