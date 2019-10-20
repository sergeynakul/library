class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates :name, presence: true

  scope :can_write, ->(book) { where.not(name: book.authors.pluck(:name)) }
end
