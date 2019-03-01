class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    before_save {email.downcase!}

    EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
                format:{with:EMAIL_REGEX},
                uniqueness: {case_sensitve: false}

    mount_uploader :image,AvatarUploader

    has_many :active_relationships, class_name:  "Relationship",
                foreign_key: "follower_id",
                dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
                foreign_key: "followed_id",
                dependent:   :destroy

    has_many :following, 
                through: :active_relationships, source: :followed
    has_many :followers,
                 through: :passive_relationships, source: :follower
    
    has_many :lessons
    has_many :categories, through: :lessons
    has_many :answers,through: :lessons
    has_many :choices,through: :answers
    has_many :words,through: :choices
    has_many :activities
    
    def follow(other_user)
        following << other_user
    end

    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end

    def following?(other_user)
        following.include?(other_user)
    end
    
    
end
