# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    token "MyString"
    confirmed_at "2014-02-21 03:06:26"
    password ""
    name "MyString"
  end
end
