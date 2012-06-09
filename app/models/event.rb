class Event < ActiveRecord::Base
  
  validates_presence_of :title
  has_many :tracks
  
end
