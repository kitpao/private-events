class EventsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @upcoming_events = Event.all.upcoming_events
    @previous_events = Event.all.previous_events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
    @event = current_user.created_events.build(event_params)

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
