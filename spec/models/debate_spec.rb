require 'spec_helper'

describe Debate do
  it { should have_and_belong_to_many :points }
end
