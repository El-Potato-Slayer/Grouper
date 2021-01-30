FactoryBot.define do
  factory :user do
    # id {1}
    # sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com"}
    name {'John'}
    email {'john@user.com'}
    password { "123456"}
    password_confirmation { "123456"}
  end
  factory :expense do
    # id {1}
    # sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com"}
    author_id {1}
    name {'Plushy'}
    amount {20}
  end
end