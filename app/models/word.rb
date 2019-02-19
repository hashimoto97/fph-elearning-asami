class Word < ApplicationRecord
  validates :content, presence: true
  has_many :choices,dependent: :destroy
  accepts_nested_attributes_for :choices
  belongs_to :category
end
