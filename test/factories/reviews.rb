FactoryBot.define do
  factory :review do
    contenido { "MyString" }
    calificacion { 1 }
    user { nil }
    car { nil }
  end
end
