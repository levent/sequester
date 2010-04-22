class PhotosController < ApplicationController
  
  # the homepage
  def index
    @photo = Photo.latest
  end
  
end
