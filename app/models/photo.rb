class Photo < ActiveRecord::Base
  is_sluggable :title
  validates_presence_of :url
  validates_uniqueness_of :title
  default_scope :order => "created_at DESC"
  
  def thumb_url
    "#{url.gsub('.jpg', '')}_s.jpg"
  end
  
  def large_url
    "#{url.gsub('.jpg', '')}_b.jpg"
  end
  
  def next
    next_photo = Photo.find(:all, :conditions => ["id > ?", id], :limit => 1)
    next_photo.any? ? (return next_photo) : (return Photo.last)
  end
end
