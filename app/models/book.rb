class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors
  
  validates :title, presence: true
  validates :year_published, numericality: { only_integer: true }
  
  ## Scope is another word for SQL query; it is written within the model.
  ## Syntax for scope changes frequently so don't need to memorize it, just look online.
  scope :alphabetical, -> { order('title') }
  scope :last_decade, -> { where('year_published > ?', 2006) }
end
