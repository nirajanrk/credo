class Source < ActiveRecord::Base
  
<<<<<<< HEAD
  has_and_belongs_to_many:authors
=======
  has_many_belongs_to :authors
>>>>>>> af122ad6d44277c900396738baff9bf2f6662188
  
  attr_accessible :citation, :description, :journal, :title, :type, :url, :year
end
