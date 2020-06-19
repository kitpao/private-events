require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe Invitation do
    it do
      should belong_to(:event)
      should belong_to(:host).class_name('User')
      should belong_to(:invited).class_name('User')
    end

    context 'validations' do
      it do
        should validate_presence_of(:invited_id)
        should validate_uniqueness_of(:event_id).scoped_to(:invited_id)
      end
    end
  end
end