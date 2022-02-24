class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validate :select_categories

  private

  CATEGORIES = [
    /Fiction/i,
    /Non-Fiction/i
  ]

  def select_categories
    if CATEGORIES.none? { |cat| cat.match category }
      errors.add(:category, "is not included in the list")
    end
  end
end
