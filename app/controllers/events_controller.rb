class EventsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]
  
  before_filter :find_event, :only => [:edit, :update, :destroy]
  before_filter :authenticate_owner!, :only => [:edit, :update, :destroy]
  
  respond_to :html, :json
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def edit
  end
  
  def create
    @event = Event.create params[:event]    
    respond_with @event
  end
  
  def update
    @event.update_attributes params[:event]
    respond_with @event
  end
  
  def destroy
    @event.destroy
    redirect_to :action => :index
  end
  
  private
  
  def find_event
    @event = Event.find params[:id]
  end
  
  def authenticate_owner!
    respond_with_error and return unless @event.owned_by?(current_user)
  end
  
  def respond_with_error(message = "Unauthorized User", error_code = :unauthorized)
    Rails.logger.info "RESPONDING WITH ERROR #{message} and #{params}"
    #respond_with @data, :status => error_code, :location => events_path
    respond_to do |format|
      format.html {
        redirect_to(events_path, :status => error_code, :flash => { :alert => message } )
      }
    end
=begin
    respond_to do |format|
      format.json { render :json => @data, :status => @data[:status], :location => nil }
      format.xml {   render :json => @data, :status => @data[:status], :location => nil }
    end
=end
  end
  
  
end
