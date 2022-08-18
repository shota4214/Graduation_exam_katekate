class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :likes, dependent: :destroy
  has_many :like_articles, through: :likes, source: :article
  has_many :active_relationships, foreign_key: :follower_id, class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :following
  has_many :passive_relationships, foreign_key: :following_id, class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :comments, dependent: :destroy
  enum sex: {unanswered: 0, male: 1, female: 2}
  enum prefectures: {
    "---": 0,
    北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7,
    茨城県: 8, 栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14,
    新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20,
    岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24,
    滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30,
    鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35,
    徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39,
    福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46,
    沖縄県: 47
  }

  def age
    user_birthday = self.birthday
    today = Date.today.strftime("%Y%m%d").to_i
    birthday = user_birthday.strftime("%Y%m%d").to_i
    user_age = (today - birthday) / 10000
    if user_age < 10
      10
    else
      user_age.floor(-1)
    end
  end

  def following?(other_user)
    active_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    active_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end

  def self.guest
    find_or_create_by!(email: 'guest@guest.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@guest.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト管理者"
      user.admin = true
    end
  end
end
