FactoryBot.define do
  factory :hospital do
    name { Faker::University.name }
  end

  factory :doctor do
    name { Faker::Name.name_with_middle }
    specialty { Faker::IndustrySegments.super_sector }
    university { Faker::University.name }
    hospital
  end

  factory :patient do
    name { Faker::Name.name }
    age { Faker::Number.number(digits: 2) }
  end

  factory :doctor_patient do
    doctor
    patient
  end
end
