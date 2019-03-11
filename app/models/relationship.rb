class Relationship < ApplicationRecord
    after_create :store_activity
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
    validates :follower_id, presence: true
    validates :followed_id, presence: true
    has_one :activity, as: :action

    private
        def store_activity
            create_activity(user_id: follower_id)
        end
end
