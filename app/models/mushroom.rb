class Mushroom < ActiveRecord::Base
	attr_accessible :color, :name, :type, :poisonous
	
	validates :color, :presence => true,
					  :length => { :maximum => 50 }
	validates :name, :presence => true,
					 :length => { :maximum => 50 },
					 :uniqueness => { :case_sensitive => false }
	validates :type, :presence => true,
					 :length => { :maximum => 50 }
	validates :poisonous, :presence => true
end