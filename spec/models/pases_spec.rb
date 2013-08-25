require 'spec_helper'

describe Pase do
  before(:each) do
    @nota = FactoryGirl.build :notas
  end

  describe "Nota without pases" do
    it "has to be the last pase" do
      pase = FactoryGirl.create :pase_a_computos
      @nota.pases << pase
      @nota.save
      expect(@nota.ultimo_pase).to equal(pase)
    end

    it "has to be the first pase" do
      pase = FactoryGirl.create :pase_a_computos
      @nota.pases << pase
      @nota.save
      expect(@nota.primer_pase).to equal(pase)
    end
  end
end
