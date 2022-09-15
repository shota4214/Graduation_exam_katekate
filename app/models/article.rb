class Article < ApplicationRecord
  self.inheritance_column = :_type_disabled
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  is_impressionable counter_cache: true
  enum type: {article: 0, question: 1}
end
