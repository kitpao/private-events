class EventsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user.id

    if @event.save
      redirect_to  event_path(@event)
    else
      render :new
    end
  end
  
  private
    def event_params
      params.require(:event).permit(:description, :location, :date)
    end
end