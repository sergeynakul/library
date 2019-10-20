class Book < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :authors

  validates :title, :picture, presence: true

  has_one_attached :picture

  scope :can_add_in, ->(group) { where.not(title: group.books.pluck(:title)) }
end
