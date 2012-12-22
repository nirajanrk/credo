require 'spec_helper'

describe Point do
  it { should have_and_belong_to_many :debates }
end
