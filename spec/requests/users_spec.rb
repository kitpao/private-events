require 'rails_helper'

RSpec.describe "Show user endpoint", type: :request do


  describe "GET /signup" do
    before { get '/sign_up' }

    it "should return 200" do
      expect(response).to have_http_status(200)
    end
    it "should return rigth title" do
      expect(response.body).to include("Sign up form!")
      puts headers
    end
  end
  describe "POST /users" do
    it "redirects to user_path(user)" do
      get "/sign_up"
      expect(response).to render_template(:new)
      post '/users', :params => { :user => { :name => "fooo" } }
      expect(response).to redirect_to(user_path(:user))
      follow_redirect!
    end
  end
end
