Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['app_id'], ENV['secret'], {:scope => 'user_about_me'}
end
