class Place < ActiveRecord::Base
    
    belongs_to :user
    
    has_attached_file :img,
      :styles =>{
        :thumb  => "50x50",
        :medium => "300x300"
      },
      :storage => :s3,
      :s3_credentials => "#{Rails.root}/config/aws.yml",
      :path => ":attachment/:id/:style.:extension",
      :bucket => "letsdoplacesimg"
      
    validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/

    
end
