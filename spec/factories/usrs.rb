# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :usr do
    name "dan"
    password "abc123"
    password_confirmation "abc123"
  end
end
