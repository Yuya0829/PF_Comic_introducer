class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 1 }

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image(width, hieght)
    profile_image.variant(resize_to_limit: [width, hieght])
  end

  def get_default_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image
  end

  def self.guest
    find_or_create_by!(email: 'guest@guest.com', name: 'ゲストユーザー') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

end