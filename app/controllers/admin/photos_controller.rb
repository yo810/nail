class Admin::PhotosController < ApplicationController
  def index
    @photos = Photo.page(params[:page])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_photos_path(@photo)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
       redirect_to admin_photo_path(@photo.id)
    else
       render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:success] = "Photoを削除しました。"
      redirect_to admin_photos_path
    else
      render :edit
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :image)
  end
end
