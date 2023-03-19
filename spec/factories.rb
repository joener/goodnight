FactoryBot.define do
  factory :user do
    name { Faker::Lorem.sentence }
  end
  factory :timecard do
    user_id { user.id }
    time_in { Time.now }
    time_out { Time.now + 8.hours }
  end
end
