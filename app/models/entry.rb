class Entry < ActiveRecord::Base
  attr_accessible :description, :reflection, :title, :occurred_at, :image, :image_latitude, :image_longitude
  
  belongs_to :user
  validates :user, presence: true
  validates :title, presence: true
  
  has_attached_file :image,
                    :styles => { :thumbnail => "100x100#" },
                    :storage => :s3,
                    :s3_credentials => S3_CREDENTIALS
                    
end
