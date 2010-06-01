class PhotosController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:new, :create, :edit, :list, :update]
  before_filter :load_photo, :only => [:edit, :update, :show]
  
  
  def edit
  end
  
  def update
    if @photo.update_attributes(params[:photo])
      redirect_to photos_url
    else
      render :action => "edit"
    end
  end

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
    if admin_signed_in?
      @photos = Photo.all
      render and return false
    end
    respond_to do |format|
      format.html {redirect_to photo_path(Photo.first)}
      format.atom {@photos = Photo.all(:order => "created_at DESC")}
    end
  end
  
  def show
    @thumbnails = Photo.all
  end
  
  private
  
  def load_photo
    @photo = Photo.find_using_slug(params[:id])
  end
end
