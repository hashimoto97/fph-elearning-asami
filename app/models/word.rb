class Word < ApplicationRecord
  validates :content, presence: true
  has_many :choices,dependent: :destroy
  accepts_nested_attributes_for :choices
  belongs_to :category

  def correct_answer
    choices.find_by(correct: 1)
  end
end
