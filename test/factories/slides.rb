# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slide do
    sequence(:title)  {|i| "Slide #{i}"}
    subtitle          "MyString"
    content           "MyString"
    image_url         "MyString"
    sequence(:order)  {|i| i}
  end
end
