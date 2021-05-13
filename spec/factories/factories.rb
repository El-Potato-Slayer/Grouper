FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '0')}@sample.com" }
    name { 'John' }
    password { '123456' }
    password_confirmation { '123456' }
  end
  factory :group do
    association :user
    name { 'Craigslist' }
  end
  factory :expense do
    author_id { 1 }
    name { 'Plushy' }
    amount { 20 }
  end
end
