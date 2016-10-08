require 'rails_helper'

RSpec.describe Instrutor, type: :model do

  describe "validations" do
    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:profissao) }
  end

end
