class Photo < ActiveRecord::Base
  validates_presence_of :thumb_url
  validates_presence_of :url
  default_scope :order => "created_at DESC"
  
  def thumb_url
    "#{url.gsub('.jpg', '')}_s.jpg"
  end
  
  def large_url
    "#{url.gsub('.jpg', '')}_b.jpg"
  end
end
