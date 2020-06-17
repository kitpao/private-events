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
  describe "POST /signup" do
    subject { post '/users', :params => { :user => {:name => 'foo' }}}
         
    it "redirects to user_path(@user)" do
      expect(subject).to redirect_to("/users/1")
    end
  end
end