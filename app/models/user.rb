class User < ActiveRecord::Base
  before_create :generate_token

  has_many :deeds, foreign_key: "from_id"

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # pry
      user.provider = auth.provider 
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.save
    end
  end
  
  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

  validates :name, presence: true
  
end
