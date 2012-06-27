class EventsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  
  before_filter :find_event, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_owner!, :only => [:edit, :update, :destroy]
  
  before_filter :populate_event_on_params, :only => [:create]
  
  respond_to :html, :json
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def show
  end
  
  def edit
  end
  
  rescue_from Exceptions::CreatedByOtherUser, :with => :record_not_created
  def create
    @event = Event.create params[:event].merge(:other => current_user)
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
  
  def populate_event_on_params
    params[:event] = {} unless params[:event].present?
  end
  
  def record_not_created exception
    respond_with_error(exception.message) and return
  end
  
  def find_event
    @event = Event.find params[:id]
  end
  
  def authenticate_owner!
    respond_with_error and return unless @event.owned_by?(current_user)
  end
  
  def respond_with_error(message = "Unauthorized User", error_code = :unauthorized)
    Rails.logger.info "RESPONDING WITH ERROR #{message} and #{params}"
    respond_to do |format|
      format.html {
        redirect_to(events_path, :status => error_code, :flash => { :alert => message } )
      }
      format.json { render :json => { :message => message}, :status => error_code }
    end
  end
  
end