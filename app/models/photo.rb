require 'carrierwave/orm/activerecord'
class Photo < ActiveRecord::Base
  acts_as_list
  is_sluggable :title
  validates_presence_of :title
  validates_uniqueness_of :title
  default_scope :order => "position"
  
  alias_attribute :medium_url, :url

  mount_uploader :image, ImageUploader
  
  def thumb_url
    cache_url if url.blank?
    url_cf_transform
  end
  
  def next
    lower_item || Photo.first
  end
  
  protected
  
  def url_cf_transform
    regex = /(http:\/\/\w*.cdn.cloudfiles.rackspacecloud.com\/uploads\/photo\/image\/\d*\/)(\w*.jpg)/
    url.gsub(regex) {|match| "#{$1}thumb_#{$2}"}
  end
  
 # def url_transform(suffix)
 #   "#{url.gsub('.jpg', '')}#{suffix}.jpg"
 # end
 
 def cache_url
   self.url = self.image.url
   save!
 end
end
