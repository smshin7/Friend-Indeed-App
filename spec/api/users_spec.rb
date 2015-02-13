    require "rails_helper"

    describe "Users API", :type => :request do
      
      let(:request_headers) { { "Accept" => "application/json", "Content-type" => "application/json" } }
      
      it "returns a list of users" do
        User.destroy_all
        FactoryGirl.create_list(:user, 10)
        
        get "/api/users"
        expect(response).to have_http_status 200
  
        users = JSON.parse(response.body)
        expect(users.count).to eq(10)
      end
    end
