# encoding: UTF-8
require 'spec_helper'

describe User do
  
  before do
    @user = mock_model(User, :id => 23, :email => "cmilfont@gmail.com")
    @user.stub(:skip_confirmation!)
    @user.stub(:save)
    User.stub(:find_by_email).and_return(@user)
    User.stub(:new).and_return(@user)
  end
  
  context "When created user" do    
    it { User.find_for_facebook_oauth("cmilfont@gmail.com").should be_equal @user }
  end
  
  context "When not user" do
    before { User.stub(:find_by_email).and_return(nil) }
    it { User.find_for_facebook_oauth("cmilfont@gmail.com").should be_equal @user }
  end
  
end
