class Point < ActiveRecord::Base
  belongs_to :debate
  belongs_to :evidence
  validates :debate_id, presence: true, uniqueness: { scope: [:evidence_id, :supporting] }
  validates :evidence, presence: true
  acts_as_voteable
  accepts_nested_attributes_for :evidence

  attr_accessible :debate_id, :evidence_id, :supporting, :evidence_attributes
end
