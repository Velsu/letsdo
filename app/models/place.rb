class Place < ActiveRecord::Base
    # Include model localizable to make it's methods available for the model
    include Localizable
    
    mount_uploader :picture, PlaceUploader
    
    belongs_to :user
    

    
end
