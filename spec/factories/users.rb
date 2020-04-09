FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    name { "MyString" }
    email
    password { 1235235235 }
  end
end