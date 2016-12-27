class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, :religion, :gender, :date_of_birth, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
