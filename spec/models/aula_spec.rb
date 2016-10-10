require 'rails_helper'

RSpec.describe Aula, type: :model do
  describe "relationships" do
    it { should belong_to(:instrutor)}
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
end
