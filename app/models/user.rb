class User < ApplicationRecord
  has_many :timecards, dependent: :delete_all
  has_many :user_followers, foreign_key: 'user_id', class_name: 'UserFollow'
  has_many :user_follows, foreign_key: 'follower_id', class_name: 'UserFollow'

  has_many :followers, through: :user_followers
  has_many :followed_users, through: :user_follows
end
