class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :last_name, length: {minimum: 2, maximum: 20}, uniqueness: { case_sensitive: false }
  validates :first_name, length: {minimum: 2, maximum: 20}, uniqueness: { case_sensitive: false }
  validates :last_name_kana, length: {minimum: 2, maximum: 20}, uniqueness: { case_sensitive: false }
  validates :first_name_kana, length: {minimum: 2, maximum: 20}, uniqueness: { case_sensitive: false }
  validates :telephone_number, length: {maximum: 20}
  validates :email, length: {maximum: 30}
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      #user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
      user.last_name = "ゲスト"
      user.first_name = "ログイン"
      user.last_name_kana = "ゲスト"
      user.first_name_kana = "ログイン"
    end
  end
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
end
