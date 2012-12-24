class DebatesPoint < ActiveRecord::Base
  belongs_to :debate
  belongs_to :point
  validates :debate_id, uniqueness: { scope: [:point_id, :supporting] }
  acts_as_voteable
end
