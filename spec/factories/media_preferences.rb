FactoryBot.define do
  factory :media_preference do
    dogs { true }
    cats { false }
    any_animal { false }
    soft_and_cuddly { true }
    funny { true } 
  end
end
