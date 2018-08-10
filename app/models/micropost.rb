class Micropost < ApplicationRecord
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  validates :imagecont, presence: true
  validates :auth, presence: true
  validates :release, presence: true
end
