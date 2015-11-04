FactoryGirl.define do
  factory :ad do
    content 'MyText'
    association :user, factory: :user
  end
end
