class PhotosController < ApplicationController
  
  # the homepage
  def index
    @photo = Photo.latest[0]
  end
  
end
