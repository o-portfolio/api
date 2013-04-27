class Entry < ActiveRecord::Base
  
  belongs_to :user
  validates :user, presence: true
  validates :title, presence: true
  
  has_attached_file :image,
                    :styles => { :thumbnail => "100x100#" },
                    :storage => :s3,
                    :s3_credentials => S3_CREDENTIALS
                    
end
