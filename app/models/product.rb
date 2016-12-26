class Product < ApplicationRecord
  has_many :comments, as: :commentable

  belongs_to :user

  validates :name, :price, presence: true
end
