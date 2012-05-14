# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mrk do
    uurl "http://marks4.us"
    usr_id 0
    user_id 0
    tag1 "bookmark site"
    tag2 "rails demo"
    tag3 "tutorial"
    note "Site created by Dan Bikle"
  end
end
