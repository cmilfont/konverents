class Event < ActiveRecord::Base
  
  belongs_to :user
  has_many :tracks
  
  validates_presence_of :title, :user
  
  def owned_by? owner
    owner.present? && user.id == owner.id
  end
  
end
