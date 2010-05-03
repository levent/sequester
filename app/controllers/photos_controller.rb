class PhotosController < ApplicationController

  def index
    respond_to do |format|
      format.html {redirect_to photo_path(Photo.first)}
      format.atom {@photos = Photo.all(:order => "created_at DESC")}
    end
  end
  
  def show
    @photo = Photo.find_using_slug(params[:id])
    @thumbnails = Photo.all
  end
  
end
