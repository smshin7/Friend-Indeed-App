class Deed < ActiveRecord::Base

  belongs_to :user, foreign_key: "from_id"
  belongs_to :receiver, foreign_key: "to_id", class_name: "User"

  validates :body, presence: true
  validates :to_id, presence: true
end
