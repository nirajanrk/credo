
class Point < ActiveRecord::Base

has_and_belongs_to_many :sources

attr_accessible :point, :createdate

end
