FactoryGirl.define do
  factory :podcast do
    name { Faker::Company.name }
    about { Faker::Lorem.paragraph }
    slug { Faker::Name.first_name }
  end

end
