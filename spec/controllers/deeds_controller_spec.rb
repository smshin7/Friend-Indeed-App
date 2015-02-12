require 'spec_helper'

RSpec.describe DeedsController, :type => :controller do

  describe 'GET index' do
  
    before(:each) {
      get :index
    }

    it "is successful"
    it "assigns all the deeds to deeds"
    it "renders all the index view file"

  end

  describe 'GET new' do
    it "is succesful"
    it "renders the new view file"
    it "assigns a new deed to a variable deed"
    it "doesn't save any new deeds"
  end

  describe 'POST create' do
    context "when form is valid" do
      let!(:valid_attributes) do
        { body: "string", to_id: "string" }
      end

      it "added a deed record"
      it "redirects to the index"

    end

    context "when form is invalid" do
      let!(:invalid_attributes) do
        { body: nil, to_id: nil }
      end

      it "does not add a deed record"
      it "renders the new file"

    end
  end

end
