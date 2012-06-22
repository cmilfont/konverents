class Occurrence < ActiveRecord::Base
  belongs_to :track
  validates_presence_of :hour, :description
end
