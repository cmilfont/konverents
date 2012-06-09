require 'spec_helper'

describe EventsController do
  
  describe "GET 'index'" do
    let (:event) { mock_model Event }
    
    before do
      Event.should_receive(:all).once.and_return [ event ]
    end
    
    it "should be success" do
      get :index
      response.should be_success
    end
    
  end
  
  describe "GET 'new'" do
    let (:event) { mock_model Event }
    
    before do
      Event.should_receive(:new).once.and_return event
    end
    
    it "should be success" do
      get :new
      response.should be_success
    end
  end
  
  describe "POST 'create'" do
    let (:event) { mock_model Event }
    
    before do
      event.should_receive(:save).once.and_return true
      Event.should_receive(:new).once.and_return event
    end
    
    it "should be success" do
      post :create
      response.should be_redirect
    end
  end
  
  describe "POST 'create'" do
    let (:event) { mock_model Event }
    
    before do
      event.should_receive(:save).once.and_return true
      Event.should_receive(:new).once.and_return event
    end
    
    it "should not be success" do
      post :create
      response.should be_redirect
    end
  end

end