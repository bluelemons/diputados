require 'spec_helper'

describe Proyecto do

  subject { create :proyecto }

  it { respond_to :return_to_comision? }

  it 'have returned to comision if have a sesion that says so' do
    sesion = create :sesion, resuvotac: 3
    subject.sesions << sesion
    expect(subject.return_to_comision?).to be_true
  end

  it 'may have reasigned comisions' do
    comision = create :comision
    sesion = create :sesion, resuvotac: 3, comision1: comision.id
    subject.sesions << sesion
    expect(subject.reasigned_comisions).to include comision
  end

end
