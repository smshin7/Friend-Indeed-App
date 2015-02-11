require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryGirl.build(:user, name: nil)
    expect(user).to be_invalid
  end

  it "is invalid without a " do
    user = FactoryGirl.build(:user, token: nil)
    expect(user).to be_invalid
  end

end
