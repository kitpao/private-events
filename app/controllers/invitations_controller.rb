class InvitationsController < ApplicationController
  before_action :require_user
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.host = current_user
    @invitation.event_id = session[:current_event]
    #@invitation = current_user.created_events.find(session[:current_event]).invitations.build(invitations_params)
    redirect_to event_path(@invitation.event_id) if @invitation.save
  end

  private
    def invitation_params
      params.require(:invitation).permit(:invited_id)
    end
end
