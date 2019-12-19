FactoryBot.define do
  factory :time_preference do
    morning { false }
    midday { false }
    evening { false }
    random { true } 
  end
end
