require 'rails_helper'

RSpec.describe User, type: :model do
  describe Host do
    it "has invitations" do
      should have_many(:invitations).class_name('Invitation')
    end
  end
=begin
  host.invitations ->
  invited.invitations
  host.event
=end

end
