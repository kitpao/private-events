require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should validates field' do
      should validate_presence_of(:name)
      should validate_uniqueness_of(:name).case_insensitive
      should validate_length_of(:name)
        .is_at_least(3)
        .is_at_most(50)
        .on(:create)
    end
  end

  describe 'associations' do
    it 'should have many events and invitations' do
      should have_many(:created_events).class_name('Event').with_foreign_key(:host_id).dependent(:destroy)
      should have_many(:created_invitations).through(:created_events).source(:invitations).dependent(:destroy)
      should have_many(:received_invitations).class_name('Invitation').with_foreign_key(:invited_id).dependent(:destroy)
      should have_many(:attended_events).through(:received_invitations).source(:event)
    end
  end

  describe 'Create User' do
    let(:user) { build(:user) }
    it 'should save user' do
      expect(user.save).to eq(true)
    end
    it 'should validate' do
      user.name = nil
      expect(user.save).to eq(false)
    end
  end
end
