# encoding: UTF-8
require 'spec_helper'

describe Track do
  
  describe "Validations" do
    it { should validate_presence_of :event }
    it { should validate_presence_of :date }
		it "date not before today" do
			subject.date = (Time.now.ago 1.day).strftime("%Y-%m-%d")
			subject.date.should_not > Date.today
		end
		it "date today is valid" do
			subject.date = (Time.now).strftime("%Y-%m-%d")
			subject.date.should == Date.today
		end
  end

  describe "relationships" do
    it { should belong_to :event }
    it { should have_many :occurrences}
  end
  
end
