require 'faker'
FactoryGirl.define do
  factory :setting do |f|
     f.var { Faker::Name.var }
     f.value { Faker::Name.value }
  end
end