class Category < ApplicationRecord
    validates :title, presence: true
    has_many :words
    has_many :lessons
end
