# encoding: UTF-8
require 'spec_helper'

describe Occurrence do

  describe "Validations" do
    it { should validate_presence_of :hour }
    it { should validate_presence_of :description }
  end

  describe "relationships" do
    it { should belong_to :track }
  end
  
  describe "palestra" do
    before do
      @palestra = mock_model("Palestra", :id => 23, :description => "Palestra RoR")
      @occurence = mock_model(Occurrence, :id => 1, :hour => "17:00", :description => "...")
    end
    it "occurrence should be a palestra" do
      @occurrence.stub(:palestra).and_return(@palestra.description).should == "Palestra RoR"
    end
  end
end
