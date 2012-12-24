require 'spec_helper'

describe Debate do
  it { should have_many(:points).through(:debates_points) }
  it { should validate_uniqueness_of :title }
  it { should validate_presence_of :title }
end