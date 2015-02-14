require 'rails_helper'

RSpec.describe Deed, type: :model do
  it "should have a user" do
    deed = FactoryGirl.build(:deed)
    expect(deed.user.present?).to eq(true)
  end

  it "is invalid without body" do
    deed = FactoryGirl.build(:deed, body: nil)
    expect(deed).to be_invalid
  end

  it "is invalid without a person to send to" do
    deed = FactoryGirl.build(:deed, to_id: nil)
    expect(deed).to be_invalid
  end
end
