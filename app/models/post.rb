class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :photos, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  validates :caption, presence: true
end
