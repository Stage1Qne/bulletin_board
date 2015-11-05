FactoryGirl.define do
  factory :comment do
    association :user, factory: :user
    association :ad, factory: :ad
    content 'MyText'
  end
end
