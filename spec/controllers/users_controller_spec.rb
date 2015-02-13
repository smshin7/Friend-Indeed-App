require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'GET index' do
    let!(:user1) { User.create!(provider: "facebook", name: "Scott", uid: "123", token: "1234") }
    let!(:user2) { User.create!(provider: "facebook", name: "Scott", uid: "123", token: "1234") }

    before(:each) {
      get :index
    }

    it "is successful" do
      expect(response).to be_success
    end

    it "assigns all users to users" do
      expect(assigns(:users)).to include(user1,user2)  
    end

    it "renders index view file" do
      expect(response).to render_template(:index)
    end

  end

  describe 'GET show' do
    let!(:user) { User.create!(provider: "facebook", name: "Scott", uid: "123", token: "1234") }
    
    before(:each) {
      get :show, id: user.id
    }
    
    it "is successful" do
      expect(response).to be_success
    end

    it "renders the show view file" do
      expect(response).to render_template(:show)
    end
    
    it "assigns the requested user to a variable user" do
      expect(assigns(:user)).to eq(user) 
    end
  end

end
