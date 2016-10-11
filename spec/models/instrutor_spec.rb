require 'rails_helper'

RSpec.describe Instrutor, type: :model do

  describe "validations" do
    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:profissao) }
  end

  describe "relationships" do
    it { should have_many(:aulas).dependent(:destroy) }
    it { should have_many(:instancia_aulas).through(:aulas) }
    it { should accept_nested_attributes_for(:aulas)}
  end

end
