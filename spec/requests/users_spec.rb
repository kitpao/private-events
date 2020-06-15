require 'rails_helper'

RSpec.describe "Show user endpoint", type: :request do
  let!(:user){ create(:user) }
  describe 'show page' do
    it 'shows the right content' do
      visit user_path(user)
      p user
      expect(page).to have_content(user.name)
    end
  end
end