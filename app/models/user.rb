class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one :profile

  validates :name, :email, presence: true
end
