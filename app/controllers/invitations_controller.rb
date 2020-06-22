class InvitationsController < ApplicationController
  before_action :require_user
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.host = current_user
    @invitation.event_id = session[:current_event]
    if @invitation.save
      flash[:success] = 'You have sent the invitation'
      redirect_to event_path(@invitation.event_id)
    else
      flash.now[:danger] = 'This user has already been invited'
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invited_id)
  end
end
