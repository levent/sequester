class AddCachedSlugToPhotos < ActiveRecord::Migration
  
  def self.up
    add_column :photos, :cached_slug, :string
    add_index  :photos, :cached_slug
  end

  def self.down
    remove_column :photos, :cached_slug
  end
  
end
