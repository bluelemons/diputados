require 'spec_helper'

describe Nota do

  context 'when creating a new expediente' do

    it 'should create a new initiator and relate it to the expediente' do
      nota = FactoryGirl.create :nota
      kind = FactoryGirl.create :initiators_kind
      Initiator.where(name: 'judicial').count.should == 0
      nota.initiators = {name: 'judicial', initiators_kind_id: kind.id}
      Initiator.where(name: 'judicial').count.should == 1
    end

    it 'should relate it to an existent initiator' do
      nota = FactoryGirl.create :nota
      kind = FactoryGirl.create :initiators_kind
      Initiator.where(name: 'judicial').count.should == 0
      nota.initiators = {name: 'judicial', initiators_kind_id: kind.id}
      Initiator.where(name: 'judicial').count.should == 1
      nota.initiators = {name: 'judicial', initiators_kind_id: kind.id}
      Initiator.where(name: 'judicial').count.should == 1
    end
  end

end
