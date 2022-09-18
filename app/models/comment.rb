class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :notifications, dependent: :destroy
  validates :content, presence: true
end
