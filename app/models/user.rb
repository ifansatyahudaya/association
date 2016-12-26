class User < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :products, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :name, :email, presence: true
end
