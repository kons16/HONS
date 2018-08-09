class Micropost < ApplicationRecord
  belongs_to :user
  include RankedModel
  ranks :row_order
  
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  validates :imagecont, presence: true
end
