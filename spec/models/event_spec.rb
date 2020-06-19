require 'factory_bot'
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

      #let(:host_created) { FactoryBot.create(:user) }
      let(:event_created) { FactoryBot.create(:event)}
      it 'scopes' do

        10.times do |i|
          events_created << event_created
        end
        @events = events_created.upcoming_events

        expect(@events).to be_empty
        
      end
   end

end
