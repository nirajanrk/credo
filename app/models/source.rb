class Source < ActiveRecord::Base
  
  has_many :authors
  
  attr_accessible :citation, :description, :journal, :title, :type, :url, :year
end
