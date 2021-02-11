FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { "test001" }
    end
  end
  