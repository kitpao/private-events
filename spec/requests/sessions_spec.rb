require 'rails_helper'

RSpec.describe "Log in", type: :request do
  describe "GET /sign_in" do
    before { get '/sign_in' }
    it "has 200 status" do
      expect(response).to have_http_status(200)
    end
    it "has correct title" do
      expect(response.body).to include("Log in form!")
    end
  end

  describe "POST /sessions" do
    user = User.create(name: 'foo')

    subject { post '/sessions', :params => { :session => { name: 'foo' } } }

    it "redirects to user_path(user)" do
      expect(subject).to redirect_to('/users/1')
    end
  end
end
