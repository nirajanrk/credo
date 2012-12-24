require 'spec_helper'

describe Point do
  it { should have_and_belong_to_many :sources }
  it { should have_many(:debates).through(:debates_points) }
  it { should allow_mass_assignment_of :title }
  it { should allow_mass_assignment_of :source_ids}
  it { should validate_uniqueness_of :title }
  it { should validate_presence_of :title }
end
