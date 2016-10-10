class Aula < ApplicationRecord
  belongs_to :instrutor
  has_many :instancia_aulas, dependent: :destroy

  store_accessor :monday, :monday_start, :monday_end
  store_accessor :tuesday, :tuesday_start, :tuesday_end
  store_accessor :wednesday, :wednesday_start, :wednesday_end
  store_accessor :thursday, :thursday_start, :thursday_end
  store_accessor :friday, :friday_start, :friday_end
  store_accessor :saturday, :saturday_start, :saturday_end
  store_accessor :sunday, :sunday_start, :sunday_end

  extend HashMethods
  days_methods :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday

  DAYS = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']

  after_create :create_instancias
  before_save :set_semana

  def numero_semana
    semana.cweek if semana.present?
  end

  def dias_de_aula
    dias = []
    DAYS.each do |day|
      dias << day if send("happens_#{day}?")
    end
    dias
  end

  def self.dia_to_number(dia)
    case dia
    when 'sunday'
      return 0
    when 'monday'
      return 1
    when 'tuesday'
      return 2
    when 'wednesday'
      return 3
    when 'thursday'
      return 4
    when 'friday'
      return 5
    when 'saturday'
      return 6
    else
      return nil
    end
  end

  def self.number_to_dia(number)
    case number
    when 0
      return 'sunday'
    when 1
      return 'monday'
    when 2
      return 'tuesday'
    when 3
      return 'wednesday'
    when 4
      return 'thursday'
    when 5
      return 'friday'
    when 6
      return 'saturday'
    else
      return nil
    end
  end

  private
  def set_semana
    semana = Date.today unless semana.present?
  end

  def create_instancias
    dias = dias_de_aula
    dates = nil

    if dinamica?
      week = (semana.to_datetime.beginning_of_week..semana.to_datetime.end_of_week).to_a
      aula_wdays = dias.map { |d| Aula.dia_to_number(d) }
      dates = week.select { |d| aula_wdays.include? d.wday }
    else
      start_date = DateTime.now
      end_date = DateTime.now + quantidade_semanas.weeks
      numero_dias = dias.map { |d| Aula.dia_to_number(d) }
      dates = (start_date..end_date).to_a.select {|d| numero_dias.include?(d.wday)}
    end

    dates.each do |date|
      dia = Aula.number_to_dia(date.wday)
      start_hour = send("#{dia}_start").split(":").first.to_i
      end_hour = send("#{dia}_end").split(":").first.to_i
      start_minute = send("#{dia}_start").split(":").second.to_i
      end_minute = send("#{dia}_end").split(":").second.to_i
      start_datetime = DateTime.new(date.year, date.month, date.day, start_hour, start_minute)
      end_datetime = DateTime.new(date.year, date.month, date.day, end_hour, end_minute)
      InstanciaAula.create(inicio: start_datetime, fim: end_datetime, aula_id: self.id)
    end
  end
end
