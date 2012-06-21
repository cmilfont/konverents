require 'spec_helper'

describe EventsController do
  
  describe "GET 'index'" do
    let (:event) { mock_model Event }
    before do
      @events = [ event ]
      Event.should_receive(:all).once.and_return @events
      get :index
    end
    it { response.should be_success }
    it { should assign_to(:events).with(@events) }
  end
  
  context "Unlogged" do
    
    describe "GET 'new'" do
      before { get :new }
      it { response.should redirect_to user_session_path }
    end
      
    describe "GET 'edit'" do
      before { get :edit, :id => 1 }
      it { response.should redirect_to new_user_session_path }
    end
      
    describe "POST 'create'" do
      before { post :create }
      it { response.should redirect_to new_user_session_path }
    end
      
    describe "PUT 'update'" do
      before { put :update, :id => 1 }
      it { response.should redirect_to new_user_session_path }
    end
      
    describe "DELETE 'destroy'" do
      before { put :update, :id => 1 }
      it { response.should redirect_to new_user_session_path }
    end

  end
  
  context "Logged" do    

    before (:each) do
      login
    end
    
    describe "GET 'new'" do
      before { get :new }
      it { should render_template :new }
      specify { should assign_to(:event).with_kind_of(Event) }
    end
    
    describe "POST 'create' " do
      
      context "with sucess" do
        let(:event) { assigns[:event] }
        before { post :create, :event => { :title => "JavaCE", :user_id => @user.id } }
        it { should respond_with_content_type(:html) }
        it { should assign_to(:event) }
        it { event.should be_valid }
        it { should respond_with(:redirect) }
        it { should_not set_the_flash }
        it { response.should redirect_to event_path(event)}
      end
      
      context "with failure" do
        let(:event) { assigns[:event] }
        before { post :create }
        it { should render_template :new }
        it { event.should_not be_valid }
        it { event.should have(2).errors }
        it { event.should have(1).error_on(:title)}
        it { event.should have(1).error_on(:user)}
      end
      
    end
    
    context "when is owned by logged user" do
      
      let(:event) { FactoryGirl.create(:event, :user => @user) }
      
      describe "GET 'edit'" do
        before { get :edit, :id => event.id }
        it { should assign_to(:event) }
        it { should render_template :edit }
      end
      
      describe "PUT 'update'" do
        before { put :update, :id => event.id, :event => { :title => "JavaCE Conference" } }
        it { should assign_to(:event) }
        it { assigns[:event].should be_valid }
        it { assigns[:event].title.should == "JavaCE Conference" }
      end
      
      describe "DELETE 'destroy'" do
        before { delete :destroy, :id => event.id }
        it { should respond_with(:redirect) }
      end
      
      describe "DELETE 'destroy' with exception" do
        it {
          lambda {
            delete :destroy, :id => 2
          }.should raise_error(ActiveRecord::RecordNotFound, "Couldn't find Event with id=2")
        }
      end
      
    end
    
    context "when isn't owned by logged user" do
      
      before do
        @owner = FactoryGirl.create(:user, :email => "teste@milfont.org")
        @owner.confirm!
        @event = FactoryGirl.create(:event, :user => @owner)
      end
      
      describe "GET 'edit'" do
        before { get :edit, :id => @event.id }
        it { should respond_with(:unauthorized) }
        it { should set_the_flash.to(/Unauthorized User/i) }
      end
      
      describe "PUT 'update'" do
        before { put :update, :id => @event.id }
        it { should respond_with(:unauthorized) }
        it { should set_the_flash.to(/Unauthorized User/i) }
      end
      
      describe "DELETE 'destroy'" do
        before { delete :destroy, :id => @event.id }
        it { should respond_with(:unauthorized) }
        it { should set_the_flash.to(/Unauthorized User/i) }
      end
      
    end
    
  end
end