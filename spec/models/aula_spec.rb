require 'rails_helper'

RSpec.describe Aula, type: :model do
  describe "relationships" do
    it { should belong_to(:instrutor)}
    it { should have_many(:instancia_aulas).dependent(:destroy)}
  end

  describe "json fields methods" do
    let(:aula) { build(:aula) }

    it "monday times" do
      expect(aula).to respond_to(:monday_start)
      expect(aula).to respond_to(:monday_end)
    end

    it "tuesday times" do
      expect(aula).to respond_to(:tuesday_start)
      expect(aula).to respond_to(:tuesday_end)
    end

    it "wednesday times" do
      expect(aula).to respond_to(:wednesday_start)
      expect(aula).to respond_to(:wednesday_end)
    end

    it "thursday times" do
      expect(aula).to respond_to(:thursday_start)
      expect(aula).to respond_to(:thursday_end)
    end

    it "friday times" do
      expect(aula).to respond_to(:friday_start)
      expect(aula).to respond_to(:friday_end)
    end

    it "saturday times" do
      expect(aula).to respond_to(:saturday_start)
      expect(aula).to respond_to(:saturday_end)
    end

    it "sunday times" do
      expect(aula).to respond_to(:sunday_start)
      expect(aula).to respond_to(:sunday_end)
    end
  end

  describe "instance methods" do
    let(:aula) { build(:aula) }

    it "#numero_semana" do
      expect(aula.numero_semana).to eq 1
    end

    it "#dias_de_aula" do
      aula.saturday = {}
      aula.sunday = {}
      expect(aula.dias_de_aula).to contain_exactly('monday', 'tuesday', 'wednesday', 'thursday', 'friday')
    end
  end

  describe "class methods" do
    it "#dia_to_number" do
      expect(Aula.dia_to_number('sunday')).to eq 0
      expect(Aula.dia_to_number('monday')).to eq 1
      expect(Aula.dia_to_number('tuesday')).to eq 2
      expect(Aula.dia_to_number('wednesday')).to eq 3
      expect(Aula.dia_to_number('thursday')).to eq 4
      expect(Aula.dia_to_number('friday')).to eq 5
      expect(Aula.dia_to_number('saturday')).to eq 6
    end

    it "#number_to_dia" do
      expect(Aula.number_to_dia(0)).to eq 'sunday'
      expect(Aula.number_to_dia(1)).to eq 'monday'
      expect(Aula.number_to_dia(2)).to eq 'tuesday'
      expect(Aula.number_to_dia(3)).to eq 'wednesday'
      expect(Aula.number_to_dia(4)).to eq 'thursday'
      expect(Aula.number_to_dia(5)).to eq 'friday'
      expect(Aula.number_to_dia(6)).to eq 'saturday'
    end
  end
end
