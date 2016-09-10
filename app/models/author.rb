class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  scope :alphabetical, -> { order('last_name, first_name') }
  
  def name
    "#{last_name}, #{first_name}"
end
