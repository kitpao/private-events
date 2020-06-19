require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe Invitation do
    should belong_to(:event)
    should belong_to(:host).class_name('User')
    should belong_to(:invited).class_name('User')

    should validate_presence_of(:invited_id)
    should validate_uniqueness_of(:event_id).scoped_to(:invited_id)
  end
end