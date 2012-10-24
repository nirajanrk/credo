<<<<<<< HEAD
class Point < ActiveRecord::Base
  attr_accessible :point, :createdate
=======
class Author < ActiveRecord::Base
	
	has_many_belongs_to :sources
	

  attr_accessible :point
>>>>>>> af122ad6d44277c900396738baff9bf2f6662188
end
