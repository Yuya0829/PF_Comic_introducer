class Genre < ApplicationRecord

  validates :name, presence: true

  has_many :post_image_genres
  has_many :post_images, through: :post_image_genres, dependent: :destroy

end
