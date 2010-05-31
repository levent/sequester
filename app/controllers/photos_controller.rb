class PhotosController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:new, :create]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      redirect_to photos_path
    else
      render :action => 'new'
    end
  end

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
