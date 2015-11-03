FactoryGirl.define do
  factory :user do
    role 0
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.between(20.years.ago, Time.zone.today) }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Team.state }
    country { Faker::Address.country }
    zip { Faker::Address.zip_code }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end

  # This will use the User class (Moderator would have been guessed)
  factory :moderator, class: User do
    role 1
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.between(20.years.ago, Time.zone.today) }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Team.state }
    country { Faker::Address.country }
    zip { Faker::Address.zip_code }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    role 2
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.between(20.years.ago, Time.zone.today) }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Team.state }
    country { Faker::Address.country }
    zip { Faker::Address.zip_code }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
