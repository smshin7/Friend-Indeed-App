class ApiKey < ActiveRecord::Base

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
  
end