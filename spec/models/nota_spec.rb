require 'spec_helper'

describe Nota do

  context 'when creating a new expediente' do
    it 'should relate it to an existent initiator' do
      nota = FactoryGirl.create :nota
      kind = FactoryGirl.create :initiators_kind
      nota.initiator = {name: 'judicial', initiators_kind_id: kind.id}
    end
      
    it 'should create a new initiator and relate it to the expediente'
  end
  
end
