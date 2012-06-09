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
  
  context "Unlogged" do
    describe "GET 'new'" do

      it "should be success" do
        get :new
        response.should be_redirect
        response.should redirect_to new_user_session_path
      end
    end

    describe "POST 'create'" do
      it "should be success" do
        post :create
        response.should be_redirect
        response.should redirect_to new_user_session_path
      end
    end

    describe "POST 'create'" do    
      it "should not be success" do
        post :create
        response.should be_redirect
        response.should redirect_to new_user_session_path
      end
    end
  end
  
  context "Logged user" do    
    before do
      @user = FactoryGirl.create :user
      sign_in @user
    end
    
    describe "GET 'new'" do
      it "should be success" do
        get :new
        response.should be_redirect
        response.should redirect_to new_event_path
      end
    end

    describe "POST 'create'" do
      it "should be success" do
        post :create
        response.should be_success
      end
    end

    describe "POST 'create'" do    
      it "should not be success" do
        post :create
        response.should be_redirect
        response.should redirect_to new_user_session_path
      end
    end
  end
end