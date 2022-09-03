class PostImage < ApplicationRecord

  validates :image, presence: true
  validates :comic_name, presence: true
  validates :caption, presence: true
  validates :genre_id, presence: true
  validates :star, presence: true


  has_one_attached :image

  belongs_to :user

  belongs_to :genre

  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.search(keyword)
     where(["comic_name like? OR caption like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def favorited_by?(user)
    favorites.exists?
  end

end
