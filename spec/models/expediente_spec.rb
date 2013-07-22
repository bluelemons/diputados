require 'spec_helper'

describe Expediente do

  subject { create :expediente }

  it 'has a valid factory for specs' do
    expect(subject).to be_valid
  end

  it 'may have references to other dossiers' do
    referenced = create :expediente, created_at: 2.years.ago
    subject.references_to << referenced
    subject.save
    subject.reload
    expect(subject.references_to).to include(referenced)
    expect(referenced.referred).to include(subject)
  end

end
