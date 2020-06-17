class EventsController < ApplicationController
  before_action :require_user, except: [:index, :show]
end