require 'spec_helper'

describe Debate do
  it { should have_many(:evidences).through(:points) }
  it { should validate_uniqueness_of :title }
  it { should validate_presence_of :title }
  it { should validate_presence_of :summary }
end
