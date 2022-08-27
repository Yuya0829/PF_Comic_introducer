class Genre < ApplicationRecord

  validates :name, presence: true

  has_many :post_images, dependent: :destroy

end
