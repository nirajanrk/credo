require 'spec_helper'

describe Point do
  it { should belong_to :evidence }
  it { should belong_to :debate }
  it { should validate_uniqueness_of(:debate_id).scoped_to([:evidence_id, :supporting]) }
  it { should validate_presence_of(:debate_id) }
  it { should validate_presence_of(:evidence) }
  it { should accept_nested_attributes_for :evidence }
end
