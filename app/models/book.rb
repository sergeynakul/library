class Book < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :authors

  validates :title, :picture, presence: true

  has_one_attached :picture
end
