class PhotosController < ApplicationController
  
  # the homepage
  def index
    redirect_to photo_path(Photo.first)
  end
  
  def show
    @photo = Photo.find_using_slug(params[:id])
    @thumbnails = Photo.all
  end
  
end
