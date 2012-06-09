class Track < ActiveRecord::Base
  
  belongs_to :event
  has_many :occurrences
  
  validates_presence_of :event, :date
  
end