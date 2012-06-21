# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :user do
    email "cmilfont@milfont.org"
    password "123456"
    password_confirmation "123456"
    remember_me true
  end
  
  factory :event do
    title "CEJS Conf 2012"
    user
  end
  
end