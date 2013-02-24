	class Point < ActiveRecord::Base
  belongs_to :debate
  belongs_to :evidence
  validates :debate_id, uniqueness: { scope: [:evidence_id, :supporting] }
  acts_as_voteable
  
 attr_accessible :debate_id, :supporting
end
