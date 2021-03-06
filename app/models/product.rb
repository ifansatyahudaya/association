class Product < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  belongs_to :category

  validates :name, :price, presence: true
end
