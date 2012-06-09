# encoding: UTF-8
require 'spec_helper'

describe Track do
  
  describe "Validations" do
    it { should validate_presence_of :event }
    it { should validate_presence_of :date }
  end

  describe "relationships" do
    it { should belong_to :event }
    it { should have_many :occurrences}
  end
  
end