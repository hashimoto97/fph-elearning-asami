class Lesson < ApplicationRecord
  after_create :store_activity
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :choices,through: :answers
  has_many :words,through: :category

  has_one :activity, as: :action

  def result
    choices.where(correct: 1)
  end

  private
    def store_activity
      create_activity(user_id: user_id)
    end
end
