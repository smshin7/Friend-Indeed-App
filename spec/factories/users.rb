FactoryGirl.define do
  factory :user do
    provider "facebook"
    uid "user_id"
    name "user_name"
    referrer "hello"
    created_at "123"
    token "mystring"
    updated_at "123"
    oauth_token "123"
    oauth_expires_at "123"

    factory :user_with_deeds do
      transient do
        deeds_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:deed, evaluator.deeds_count, user: user)
      end
    end
  end
end
