class Author < ActiveRecord::Base
	
	has_many_belongs_to :sources

  attr_accessible :firstname, :lastname, :middlename
end
