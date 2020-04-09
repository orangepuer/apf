FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user
    blog
  end
end
