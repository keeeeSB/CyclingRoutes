FactoryBot.define do
  factory :user do
    name { '佐藤 太郎' }
    sequence(:email) { "user_#{_1}@example.com" }
    password { 'password12345' }
    confirmed_at { Time.current }
  end
end
