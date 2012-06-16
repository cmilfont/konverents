class EventsController < ApplicationController
  
  # before_filter :authenticate_user!, :only => [ :new, :create, :update, :edit ]
  before_filter :authenticate_user!
  
  before_filter :authenticate_owner!, :only => [:update, :edit]
  
  respond_to :html, :json
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.create params[:event]
    respond_with @event
  end
  
  def update
    @event = Event.find params[:id]
    @event.update_attributes params[:event]
    respond_with @event
  end
  
  private
  def authenticate_owner!
    unless @event.owned_by?(current_user)
      respond_with({:error=>'unauthorised'}, :status => :forbidden) and return
    end
  end
  
end
