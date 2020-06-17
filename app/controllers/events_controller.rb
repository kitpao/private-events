class EventsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    render json: { happy: 'Im the index '}
  end
end