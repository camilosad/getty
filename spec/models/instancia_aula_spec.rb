require 'rails_helper'

RSpec.describe InstanciaAula, type: :model do
  describe "validations" do
    it { should validate_presence_of(:inicio) }
    it { should validate_presence_of(:fim) }
  end

  describe "relationships" do
    it { should belong_to(:aula)}
  end
end
