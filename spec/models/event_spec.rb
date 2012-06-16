# encoding: UTF-8
require 'spec_helper'

describe Event do
  
  describe "Validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :user }
  end

  describe "relationships" do
    it { should have_many :tracks}
    it { should belong_to :user}
  end
  
  describe "#owned_by?" do
    
    subject { Event.new(:user => @user) }
    
    context "Event created by cmilfont@gmail.com" do
      before { @user = mock_model(User, :id => 23, :email => "cmilfont@gmail.com") }
      it "should be owned by same creator" do
         should be_owned_by @user
      end
    end
      
    it { should_not be_owned_by nil }
    
  end
  
end