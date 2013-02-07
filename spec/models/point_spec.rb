require 'spec_helper'

describe Point do
  it { should belong_to :evidence }
  it { should belong_to :debate }
  it { should validate_uniqueness_of(:debate_id).scoped_to([:evidence_id, :supporting]) }
end
