FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 6) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    user_name { Faker::Name.user_name }
    reset_password_token { Faker::Alphanumeric.alpha(number: 10) }
    reset_password_sent_at { Faker::Time.between(from: 2.days.ago, to: Time.now, format: :default) }
  end
end
