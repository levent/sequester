class PhotosController < ApplicationController
  
  # the homepage
  def index
    redirect_to photo_path(Photo.latest[0])
  end
  
  def show
    @photo = Photo.find(params[:id])
    @thumbnails = Photo.all
  end
  
end
