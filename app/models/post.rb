class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :likes
  has_many :likers, through: :likes, source: :user

  validates :photos, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  validates :caption, presence: true
end
