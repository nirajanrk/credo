class Point < ActiveRecord::Base
  has_and_belongs_to_many :sources
  has_and_belongs_to_many :debates
end
