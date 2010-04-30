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
end
