require_relative './controller_macros'

RSpec.configure do |config|
  config.include Deivse::Test::ControllerHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller
end
# FactoryBot.define do
#   factory :user do
#     id {1}
#     name {"John"}
#     email {"John@user.com"}
#     password {"123456"}
#     password_confirmation {"123456"}
#   end
# end