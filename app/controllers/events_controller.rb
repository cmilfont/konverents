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
    else
      flash[:notice] = "Ocorreu um erro para salvar o evento"
    end
    redirect_to events_path
  end
  
end
