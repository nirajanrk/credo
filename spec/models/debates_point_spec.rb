require 'spec_helper'

describe DebatesPoint do
  it { should belong_to :point }
  it { should belong_to :debate }
  it { should validate_uniqueness_of(:debate_id).scoped_to([:point_id, :supporting]) }
end
