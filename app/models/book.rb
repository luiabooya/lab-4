class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors
  
  validates :title, presence: true
  validates :year_published, numericality: { only_integer: true }
  
  scope :alphabetical, -> { order('title') }
  scope :last_decade, -> { where('year_published > ?', 2006) }
end
