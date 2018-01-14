FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "test#{n}@test.com"}
    sequence(:name) {|n| "name#{n}"}
    sequence(:phone) {|n| "8903322112#{n}"}
    password 'password'
  end
end
