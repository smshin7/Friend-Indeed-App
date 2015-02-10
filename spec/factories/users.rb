FactoryGirl.define do
  factory :user do
    provider "facebook"
    uid "user_id"
    name "user_name"
  end
end