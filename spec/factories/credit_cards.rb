# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credit_card do
    last_name "MyString"
    first_name "MyString"
    number "MyString"
    month "MyString"
    year "MyString"
    verification_value "MyString"
    billing_address "MyString"
    card_type "MyString"
  end
end
