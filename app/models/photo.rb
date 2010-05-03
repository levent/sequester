class Photo < ActiveRecord::Base
  acts_as_list
  is_sluggable :title
  validates_presence_of :url
  validates_uniqueness_of :title
  default_scope :order => "position", :limit => 13
  
  def thumb_url
    "#{url.gsub('.jpg', '')}_s.jpg"
  end
  
  def large_url
    "#{url.gsub('.jpg', '')}_b.jpg"
  end
  
  def next
    lower_item || Photo.first
  end
end
