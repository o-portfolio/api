class Entry < ActiveRecord::Base
  attr_accessible :description, :reflection, :title, :occurred_at, :image, :image_latitude, :image_longitude
  
  validates_presence_of :title
  
  has_attached_file :image,
                    :styles => { :thumbnail => "100x100#" },
                    :storage => :s3,
                    :s3_credentials => S3_CREDENTIALS
  
end
