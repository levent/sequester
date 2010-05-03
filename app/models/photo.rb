class Photo < ActiveRecord::Base
  acts_as_list
  is_sluggable :title
  validates_presence_of :url
  validates_uniqueness_of :title
  default_scope :order => "position"
  
  def thumb_url
    url_transform('_s')
  end
  
  def large_url
    url_transform('_b')
  end
  
  def next
    lower_item || Photo.first
  end
  
  protected
  
  def url_transform(suffix)
    "#{url.gsub('.jpg', '')}#{suffix}.jpg"
  end
end
