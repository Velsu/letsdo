class Place < ActiveRecord::Base
    
    mount_uploader :picture, PlaceUploader
    
    belongs_to :user
   

    
end
