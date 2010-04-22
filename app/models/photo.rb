class Photo < ActiveRecord::Base
  
  named_scope :latest, :limit => 1, :order => "created_at"
  
end
