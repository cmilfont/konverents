class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    event = Event.new params[:event]
    if event.save
      flash[:notice] = "Evento salvo"
      redirect_to events_path
    else
      flash[:notice] = "Ocorreu um erro para salvar o evento"
      redirect_to new_event_path
    end
  end
  
end
