require 'rails_helper'

RSpec.describe Event, type: :model do
   describe Event do
      it do
        should belong_to(:host).class_name('User')
        should have_many(:invitations)
        should have_many(:inviteds).through(:invitations).source(:invited)
      end

      it 'validations ' do
        should validate_presence_of(:description)
        should validate_uniqueness_of(:description).case_insensitive

        should validate_presence_of(:location)
        should validate_presence_of(:date)
      end
   end

   describe 'Validation Test for Event' do
    let(:host) { create(:user) }
    let(:event) { attributes_for(:event) }
    let(:event_test) { host.created_events.build(event) } 
    
    it 'should save event' do
      expect(event_test.save).to eq(true) 
    end
    it 'should not save event' do
      event_test.description = nil
      expect(event_test.save).to eq(false)
    end
   end
end
