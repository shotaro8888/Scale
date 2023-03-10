class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :fish
  # has_many :post_tags, dependent: :destroy
  # has_many :fish, through: :post_tags
  
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :title, presence: true
  validates :content, presence: true
  validates :recipe, presence: true
  validates :method, presence: true
  validates :image, presence: true

  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
end
