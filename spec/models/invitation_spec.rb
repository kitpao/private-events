require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe Invitation do
    it do
      should belong_to(:event)
      should belong_to(:host).class_name('User')
      should belong_to(:invited).class_name('User')
    end

    it 'check validations' do
      should validate_presence_of(:invited_id)
      should validate_uniqueness_of(:event_id).scoped_to(:invited_id)
    end

    context 'Create Invitation' do
      #@invitation = Invitation.new(invitation_params)
      #@invitation.host = current_user
      #@invitation.event_id = session[:current_event]
      let(:host) { create(:user) }
      let(:event) { create(:event, host: host)}
      let(:invited) { create(:user)}
      let(:invitation_test) { Invitation.new(host: host, event: event, invited: invited) }

        it 'should save invitation' do
          expect(invitation_test.save).to eq(true)
        end
        it 'should not save invitation' do
          invitation_test.host = nil
          expect(invitation_test.save).to eq(false)
        end
    end
  end
end
