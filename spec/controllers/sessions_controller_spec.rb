require 'spec_helper'

RSpec.describe SessionsController do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]    
  end

  describe "#create" do
    it "will create a new user"
    it "will create a new session" 
    it "will redirect to current user show page"
  end

end
