class UserFollow < ApplicationRecord
  belongs_to :users, optional: true
end
