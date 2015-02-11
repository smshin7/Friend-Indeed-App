FactoryGirl.define do
  factory :user do
    id 1
    provider "facebook"
    uid "user_id"
    name "user_name"
    referrer "hello"
    created_at "123"
    updated_at "123"
    oauth_token "123"
    oauth_expires_at "123"
  end
end