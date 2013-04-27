class Assessment < ActiveRecord::Base

  belongs_to :trainee, class_name: "User"
  validates :date, presence: true
  validates :trainee, presence: true
  
end
