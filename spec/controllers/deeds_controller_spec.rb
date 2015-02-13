require 'spec_helper'

RSpec.describe DeedsController, :type => :controller do
  let(:user) {  FactoryGirl.create(:user_with_deeds)}

  describe 'GET index' do
    before(:each) {
      get :index, user_id: user.id
    }

    it "is successful" do
      expect(response).to be_success
    end

    it "assigns all the deeds to deeds" do
      expect(assigns(:deeds)).to include(user.deeds[0], user.deeds[1], user.deeds[2])
    end

    it "renders all the index view file" do
      expect(response).to render_template(:index, user_id: user.id)
    end
  end

  describe 'GET new' do
    before(:each) {
      get :new, user_id: user.id
    }

    it "is succesful" do
      expect(response).to be_success
    end
    it "renders the new view file" do
      expect(response).to render_template(:new, user_id: user.id)
    end
    
    it "assigns a new deed to a variable deed" do
      expect(assigns(:deed)).to be_a(Deed)
    end

    it "doesn't save any new deeds" do
      expect { get :new, user_id: user.id }.to change(Deed, :count).by(0)
    end
  end

  describe 'POST create' do
    context "when form is valid" do
      let!(:valid_attributes) do
        { body: "string", to_id: "string" }
      end

      it "post to deed is a valid route" do
        post :create, user_id: user.id, deed: valid_attributes
        expect(response).to have_http_status(302)
      end 

      it "added a deed record" do
        expect { post :create, user_id: user.id, deed: valid_attributes }.to change(Deed, :count).by(6)
      end

      it "redirects to the index" do
        post :create, user_id: user.id, deed: valid_attributes
        expect(response).to redirect_to user_path(user)
      end
    end

    context "when form is invalid" do
      let!(:invalid_attributes) do
        { body: nil, to_id: nil }
      end
    
      it "does not add a deed record" do
        expect{ post :create, user_id: user.id, deed: invalid_attributes }.to change(Deed, :count).by(5)
      end
        
      it "renders the new file" do
        post :create, user_id: user.id, deed: invalid_attributes 
        expect(response).to render_template(:new) 
      end

    end
  end

end
