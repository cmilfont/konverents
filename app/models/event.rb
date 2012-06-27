class Event < ActiveRecord::Base
  
  attr_accessor :other
  
  before_create :validate_created_by_other
  belongs_to :user
  has_many :tracks
  
  validates_presence_of :title, :user
  
  def owned_by? owner
    owner.present? && user.id == owner.id
  end
  
  private
  def validate_created_by_other
    msg = "Trying create an event with other user"
    raise Exceptions::CreatedByOtherUser.new(msg) unless self.user.eql? @other
  end
  
end
