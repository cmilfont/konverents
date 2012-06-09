# encoding: UTF-8
class TracksController < ApplicationController

  respond_to :html

  def index
    debugger
    @event = Event.find params[:event_id]
    @tracks = @event.tracks
    respond_with @tracks
  end

end