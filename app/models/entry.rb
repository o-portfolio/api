class Entry < ActiveRecord::Base
  attr_accessible :description, :reflection, :title, :occurred_at
  
  validates_presence_of :title
  
end
