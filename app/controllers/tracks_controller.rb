# encoding: UTF-8
class TracksController < ApplicationController

  before_filter :find_event
  respond_to :html

  def index
    @tracks = @event.tracks
    respond_with @tracks
  end
  
  def show
    @track = Track.find params[:id]
  end
  
  def new
    @track = Track.new :event_id => @event
  end
  
  def create
    @track = Track.new params[:track]
    @track.save
    respond_with @track
  end
  
  def find_event
    @event = Event.find params[:event_id]
  end

end