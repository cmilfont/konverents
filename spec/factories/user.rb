# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
      email "teste@teste.com.br"
      password "123456"
      password_confirmation "123456"
      remember_me true
    end
end