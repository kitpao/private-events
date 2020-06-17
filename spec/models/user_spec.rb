require 'rails_helper'

RSpec.describe User, type: :model do
=begin
  describe "Host" do
    it "has invitations" do
      should have_many(:invitations).class_name('Invitation')
    end
  end
  host.invitations ->
  invited.invitations
  host.event
=end

  describe "validations" do
    it "should validates field" do
      should validate_presence_of(:name)
      should validate_uniqueness_of(:name).case_insensitive
      should validate_length_of(:name).
        is_at_least(3).
        is_at_most(25).
        on(:create)
    end
  end
end
