class Product < ApplicationRecord
  has_many :comments, as: :commentable

  belongs_to :user
  belongs_to :category

  validates :name, :price, presence: true
end
