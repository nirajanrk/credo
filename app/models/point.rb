class Author < ActiveRecord::Base
	
	has_many_belongs_to :sources
	

  attr_accessible :point
end
