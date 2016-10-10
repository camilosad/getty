class Aula < ApplicationRecord
  belongs_to :instrutor

  store_accessor :monday, :monday_start, :monday_end
  store_accessor :tuesday, :tuesday_start, :tuesday_end
  store_accessor :wednesday, :wednesday_start, :wednesday_end
  store_accessor :thursday, :thursday_start, :thursday_end
  store_accessor :friday, :friday_start, :friday_end
  store_accessor :saturday, :saturday_start, :saturday_end
  store_accessor :sunday, :sunday_start, :sunday_end
end
