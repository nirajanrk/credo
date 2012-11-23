require 'spec_helper'

describe Source do
  it { should have_and_belong_to_many :authors }
  it { should accept_nested_attributes_for :authors }
  it { should validate_presence_of :title }
end
