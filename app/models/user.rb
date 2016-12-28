class User < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :products, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :name, :email, presence: true
end
