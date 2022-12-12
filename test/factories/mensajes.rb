FactoryBot.define do
  factory :mensaje do
    user { nil }
    car { nil }
    contenido { "MyString" }
  end
end
