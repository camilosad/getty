FactoryGirl.define do
  factory :instancia_aula do
    inicio DateTime.new
    fim DateTime.new
    aula nil
  end
end
