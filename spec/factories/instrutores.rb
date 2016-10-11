FactoryGirl.define do
  factory :instrutor do
    nome "Ninjutsu Kakashi"
    email "ninjutsu@email.com"
    profissao "professor"
  end

  factory :invalid_instrutor, class: Instrutor do
    nome "invalid"
  end
end
