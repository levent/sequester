class Photo < ActiveRecord::Base
  validates_presence_of :thumb_url
  validates_presence_of :url
  named_scope :latest, :limit => 1, :order => "created_at DESC"
  
  def thumb_url
    "#{url.gsub('.jpg', '')}_s.jpg"
  end
  
  def large_url
    "#{url.gsub('.jpg', '')}_b.jpg"
  end
end
