# factory girl factories
FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password "testing"
  end

  factory :url do
    sequence(:short) { |n| "blabla/short{n}.com" }
    sequence(:long) { |n| "blabla/long{n}.com" }
    visit_counter 0
    association :user, factory: :user
  end
end