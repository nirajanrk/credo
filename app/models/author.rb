class Author < ActiveRecord::Base
	
<<<<<<< HEAD

	has_and_belongs_to_many :sources
=======
	has_many_belongs_to :sources
>>>>>>> af122ad6d44277c900396738baff9bf2f6662188

  attr_accessible :firstname, :lastname, :middlename
end
