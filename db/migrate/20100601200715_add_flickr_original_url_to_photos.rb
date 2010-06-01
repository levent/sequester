class AddFlickrOriginalUrlToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :flickr_original_url, :string
  end

  def self.down
    remove_column :photos, :flickr_original_url
  end
end
