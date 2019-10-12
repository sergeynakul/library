class Group < ApplicationRecord
  has_many :books

  validates :name, presence: true
end
