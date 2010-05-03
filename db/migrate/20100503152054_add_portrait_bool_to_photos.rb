class AddPortraitBoolToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :portrait, :boolean, :default => false
  end

  def self.down
    remove_column :photos, :portrait
  end
end
