FactoryGirl.define do
  factory :aula do
    semana 1
    dinamica false
    monday = {monday_start: "10:00", monday_end: "12:00"}
    tuesday = {tuesday_start: "10:00", tuesday_end: "12:00"}
    wednesday = {wednesday_start: "10:00", wednesday_end: "12:00"}
    thursday = {thursday_start: "10:00", thursday_end: "12:00"}
    friday = {friday_start: "10:00", friday_end: "12:00"}
    saturday = {saturday_start: "10:00", saturday_end: "12:00"}
    sunday = {sunday_start: "10:00", sunday_end: "12:00"}
    instrutor nil
  end
end
